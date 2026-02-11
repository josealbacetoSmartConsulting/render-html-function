const { app } = require("@azure/functions");
const { chromium } = require("playwright");

app.http("RenderHtml", {
  methods: ["POST"],
  authLevel: "function",
  handler: async (request, context) => {
    let browser;

    try {
      let body;
      try {
        body = await request.json();
      } catch {
        return { status: 400, jsonBody: { error: "Body não é JSON válido" } };
      }

      const html = body?.html;
      const width = Number(body?.maxwidth ?? body?.maxWidth);

      if (!html) {
        return { status: 400, jsonBody: { error: "Envie { html: '<html>...</html>' }" } };
      }

      if (!Number.isFinite(width) || width <= 0) {
        return { status: 400, jsonBody: { error: "Envie maxwidth válido (> 0)" } };
      }

      // Configurações otimizadas para Azure Functions Linux
      browser = await chromium.launch({
        headless: true,
        args: [
          "--no-sandbox",
          "--disable-setuid-sandbox",
          "--disable-dev-shm-usage",
          "--disable-accelerated-2d-canvas",
          "--disable-gpu",
          "--disable-software-rasterizer",
          "--disable-web-security"
        ]
      });

      const page = await browser.newPage({
        viewport: { width, height: 100 },
        deviceScaleFactor: 1
      });

      await page.setContent(html, { waitUntil: "load" });

      const buffer = await page.screenshot({
        fullPage: true,
        type: "png"
      });

      return {
        status: 200,
        jsonBody: { base64: buffer.toString("base64") }
      };
    } catch (err) {
      context.error("Erro ao renderizar HTML:", err?.stack || err);
      
      // Log adicional para diagnóstico
      if (err?.message?.includes("libglib")) {
        context.error("ERRO: Dependências do sistema não instaladas. Execute install-dependencies.sh");
      }
      
      return { 
        status: 500, 
        jsonBody: { 
          error: err?.message ?? String(err),
          details: process.env.NODE_ENV === "development" ? err?.stack : undefined
        } 
      };
    } finally {
      if (browser) {
        try { await browser.close(); } catch (_) {}
      }
    }
  }
});