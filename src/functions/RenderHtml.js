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

      browser = await chromium.launch({
        headless: true,
        args: ["--no-sandbox", "--disable-setuid-sandbox"]
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
      context.log(err?.stack || err);
      return { status: 500, jsonBody: { error: err?.message ?? String(err) } };
    } finally {
      if (browser) {
        try { await browser.close(); } catch (_) {}
      }
    }
  }
});