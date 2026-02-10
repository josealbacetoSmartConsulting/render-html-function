$body = @{
  html = "<div style='font-family:Segoe UI, Arial, sans-serif;color:#0f172a;'>
    <table style='width:100%;border-collapse:collapse;table-layout:fixed;border:1px solid #d9dde3;border-radius:5px;overflow:hidden;' cellspacing='0' cellpadding='0'>
        <tr>
            <th colspan='2' rowspan = '3' style='width:45%; background:#0b2a67; color:#fff; text-align:left; padding-left:10px; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>
                        <img src='data:image/png;base64,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' alt='Logo' style='width: 90%; height:auto; display:block;'>
                </th>
                <th colspan='5' style=' background:#c6c6c6; border:1px solid #fff; text-align:center; padding-top:5px; padding-bottom:5px;'>26/01/26
                    </th>
                    <th colspan='5' style=' background:#c6c6c6; border:1px solid #fff; text-align:center; padding-top:5px; padding-bottom:5px;'>02/02/26
                    </th>
                    <th colspan='5' style=' background:#c6c6c6; border:1px solid #fff; text-align:center; padding-top:5px; padding-bottom:5px;'>09/02/26
                    </th>
                    <th colspan='5' style=' background:#c6c6c6; border:1px solid #fff; text-align:center; padding-top:5px; padding-bottom:5px;'>16/02/26
                    </th>
                    <th colspan='5' style=' background:#c6c6c6; border:1px solid #fff; text-align:center; padding-top:5px; padding-bottom:5px;'>23/02/26
                    </th>
                    <th colspan='5' style=' background:#c6c6c6; border:1px solid #fff; text-align:center; padding-top:5px; padding-bottom:5px;'>02/03/26
                    </th>
                    <th colspan='5' style=' background:#c6c6c6; border:1px solid #fff; text-align:center; padding-top:5px; padding-bottom:5px;'>09/03/26
                    </th>
                    <th colspan='5' style=' background:#c6c6c6; border:1px solid #fff; text-align:center; padding-top:5px; padding-bottom:5px;'>16/03/26
                    </th>
                    <th colspan='5' style=' background:#c6c6c6; border:1px solid #fff; text-align:center; padding-top:5px; padding-bottom:5px;'>23/03/26
                    </th>
                    <th colspan='5' style=' background:#c6c6c6; border:1px solid #fff; text-align:center; padding-top:5px; padding-bottom:5px;'>30/03/26
                    </th>
                    <th colspan='5' style=' background:#c6c6c6; border:1px solid #fff; text-align:center; padding-top:5px; padding-bottom:5px;'>06/04/26
                    </th>
                    <th colspan='5' style=' background:#c6c6c6; border:1px solid #fff; text-align:center; padding-top:5px; padding-bottom:5px;'>13/04/26
                    </th>
                    <th colspan='5' style=' background:#c6c6c6; border:1px solid #fff; text-align:center; padding-top:5px; padding-bottom:5px;'>20/04/26
                    </th>
                    <th colspan='5' style=' background:#c6c6c6; border:1px solid #fff; text-align:center; padding-top:5px; padding-bottom:5px;'>27/04/26
                    </th>
                    <th colspan='5' style=' background:#c6c6c6; border:1px solid #fff; text-align:center; padding-top:5px; padding-bottom:5px;'>04/05/26
                    </th>
                    </tr>
            <tr>
            <th colspan='5' 
                        style='background:#898989; color:#000; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>W5
                    </th>
                    <th colspan='5' 
                        style='background:#898989; color:#000; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>W6
                    </th>
                    <th colspan='5' 
                        style='background:#898989; color:#000; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>W7
                    </th>
                    <th colspan='5' 
                        style='background:#898989; color:#000; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>W8
                    </th>
                    <th colspan='5' 
                        style='background:#898989; color:#000; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>W9
                    </th>
                    <th colspan='5' 
                        style='background:#898989; color:#000; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>W10
                    </th>
                    <th colspan='5' 
                        style='background:#898989; color:#000; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>W11
                    </th>
                    <th colspan='5' 
                        style='background:#898989; color:#000; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>W12
                    </th>
                    <th colspan='5' 
                        style='background:#898989; color:#000; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>W13
                    </th>
                    <th colspan='5' 
                        style='background:#898989; color:#000; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>W14
                    </th>
                    <th colspan='5' 
                        style='background:#898989; color:#000; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>W15
                    </th>
                    <th colspan='5' 
                        style='background:#898989; color:#000; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>W16
                    </th>
                    <th colspan='5' 
                        style='background:#898989; color:#000; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>W17
                    </th>
                    <th colspan='5' 
                        style='background:#898989; color:#000; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>W18
                    </th>
                    <th colspan='5' 
                        style='background:#898989; color:#000; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>W19
                    </th>
                    </tr>
            <tr>
                <th colspan='5' style=' background:#0b2a67; color:#fff; text-align:center; padding:6px 0 11px 0; border:1px solid #FFFFFF;'>jan
                    </th>
                    <th colspan='20' style=' background:#0b2a67; color:#fff; text-align:center; padding:6px 0 11px 0; border:1px solid #FFFFFF;'>fev
                    </th>
                    <th colspan='25' style=' background:#0b2a67; color:#fff; text-align:center; padding:6px 0 11px 0; border:1px solid #FFFFFF;'>mar
                    </th>
                    <th colspan='20' style=' background:#0b2a67; color:#fff; text-align:center; padding:6px 0 11px 0; border:1px solid #FFFFFF;'>abr
                    </th>
                    <th colspan='5' style=' background:#0b2a67; color:#fff; text-align:center; padding:6px 0 11px 0; border:1px solid #FFFFFF;'>mai
                    </th>
                    </tr>
                <tr>
            <th colspan='2' style='background:#0b2a67; color:#fff; text-align:left; padding-left:10px; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'> Etapa
                </th>
                <th colspan='75' style='background:#0b2a67; color:#FFF; text-align:center; padding-top:5px; padding-bottom:5px; border:1px solid #FFF;'>2026</th>
                    </tr>
            
                    <tr>
                            <td rowspan='1' style='border-right:1px solid #d9dde3;border-bottom:1px solid #d9dde3;background:#3AF9B4;padding:6px 10px;font-weight:600;white-space:nowrap;'>Mobilização e Iniciação
                            </td>
                        <td style='border-right:1px solid #d9dde3;border-bottom:1px solid #d9dde3;background:#3AF9B4;padding:6px 10px;font-weight:600;white-space:nowrap;'>Mobilização e Iniciação
                        </td>
                        <td colspan='2' style='padding:0;border-bottom:1px solid #d9dde3;background:#3AF9B4;'></td>
                            <td colspan='73' style='padding:0;border-bottom:1px solid #d9dde3;border-right:1px solid #d9dde3;background:transparent;'></td>
                    </tr>
                    <tr>
                            <td rowspan='1' style='border-right:1px solid #d9dde3;border-bottom:1px solid #d9dde3;background:#2AC686;padding:6px 10px;font-weight:600;white-space:nowrap;'>Análise e Desenho
                            </td>
                        <td style='border-right:1px solid #d9dde3;border-bottom:1px solid #d9dde3;background:#2AC686;padding:6px 10px;font-weight:600;white-space:nowrap;'>Análise e Desenho
                        </td>
                            <td colspan='2' style='padding:0;border-bottom:1px solid #d9dde3;background:transparent;'></td>
                        <td colspan='13' style='padding:0;border-bottom:1px solid #d9dde3;background:#2AC686;'></td>
                            <td colspan='60' style='padding:0;border-bottom:1px solid #d9dde3;border-right:1px solid #d9dde3;background:transparent;'></td>
                    </tr>
                    <tr>
                            <td rowspan='1' style='border-right:1px solid #d9dde3;border-bottom:1px solid #d9dde3;background:#92D050;padding:6px 10px;font-weight:600;white-space:nowrap;'>Análise
                            </td>
                        <td style='border-right:1px solid #d9dde3;border-bottom:1px solid #d9dde3;background:#92D050;padding:6px 10px;font-weight:600;white-space:nowrap;'>Sprint 0
                        </td>
                            <td colspan='15' style='padding:0;border-bottom:1px solid #d9dde3;background:transparent;'></td>
                        <td colspan='2' style='padding:0;border-bottom:1px solid #d9dde3;background:#92D050;'></td>
                            <td colspan='58' style='padding:0;border-bottom:1px solid #d9dde3;border-right:1px solid #d9dde3;background:transparent;'></td>
                    </tr>
                    <tr>
                            <td rowspan='3' style='border-right:1px solid #d9dde3;border-bottom:1px solid #d9dde3;background:#00FFFF;padding:6px 10px;font-weight:600;white-space:nowrap;'>Desenvolvimento
                            </td>
                        <td style='border-right:1px solid #d9dde3;border-bottom:1px solid #d9dde3;background:#00FFFF;padding:6px 10px;font-weight:600;white-space:nowrap;'>Sprints
                        </td>
                            <td colspan='17' style='padding:0;border-bottom:1px solid #d9dde3;background:transparent;'></td>
                        <td colspan='15' style='padding:0;border-bottom:1px solid #d9dde3;background:#00FFFF;'></td>
                            <td colspan='43' style='padding:0;border-bottom:1px solid #d9dde3;border-right:1px solid #d9dde3;background:transparent;'></td>
                    </tr>
                    <tr>
                        <td style='border-right:1px solid #d9dde3;border-bottom:1px solid #d9dde3;background:#0B47FF;padding:6px 10px;font-weight:600;white-space:nowrap;'>Homologação e Estabilização
                        </td>
                            <td colspan='32' style='padding:0;border-bottom:1px solid #d9dde3;background:transparent;'></td>
                        <td colspan='3' style='padding:0;border-bottom:1px solid #d9dde3;background:#0B47FF;'></td>
                            <td colspan='40' style='padding:0;border-bottom:1px solid #d9dde3;border-right:1px solid #d9dde3;background:transparent;'></td>
                    </tr>
                    <tr>
                        <td style='border-right:1px solid #d9dde3;border-bottom:1px solid #d9dde3;background:#6666FF;padding:6px 10px;font-weight:600;white-space:nowrap;'>Treinamento
                        </td>
                            <td colspan='35' style='padding:0;border-bottom:1px solid #d9dde3;background:transparent;'></td>
                        <td colspan='14' style='padding:0;border-bottom:1px solid #d9dde3;background:#6666FF;'></td>
                            <td colspan='26' style='padding:0;border-bottom:1px solid #d9dde3;border-right:1px solid #d9dde3;background:transparent;'></td>
                    </tr>
                    <tr>
                            <td rowspan='1' style='border-right:1px solid #d9dde3;border-bottom:1px solid #d9dde3;background:#A4B5BF;padding:6px 10px;font-weight:600;white-space:nowrap;'>Operação Assistida
                            </td>
                        <td style='border-right:1px solid #d9dde3;border-bottom:1px solid #d9dde3;background:#A4B5BF;padding:6px 10px;font-weight:600;white-space:nowrap;'>Operação Assistida
                        </td>
                            <td colspan='49' style='padding:0;border-bottom:1px solid #d9dde3;background:transparent;'></td>
                        <td colspan='8' style='padding:0;border-bottom:1px solid #d9dde3;background:#A4B5BF;'></td>
                            <td colspan='18' style='padding:0;border-bottom:1px solid #d9dde3;border-right:1px solid #d9dde3;background:transparent;'></td>
                    </tr>
                    <tr>
                            <td rowspan='1' style='border-right:1px solid #d9dde3;border-bottom:1px solid #d9dde3;background:#FFC000;padding:6px 10px;font-weight:600;white-space:nowrap;'>Garantia
                            </td>
                        <td style='border-right:1px solid #d9dde3;border-bottom:1px solid #d9dde3;background:#FFC000;padding:6px 10px;font-weight:600;white-space:nowrap;'>Garantia
                        </td>
                            <td colspan='57' style='padding:0;border-bottom:1px solid #d9dde3;background:transparent;'></td>
                        <td colspan='18' style='padding:0;border-bottom:1px solid #d9dde3;background:#FFC000;'></td>
                    </tr></tr>
        </table>
    </div>"
} | ConvertTo-Json

$response = Invoke-RestMethod `
  -Method Post `
  -Uri "http://localhost:7071/api/RenderHtml" `
  -ContentType "application/json" `
  -Body $body



[IO.File]::WriteAllBytes(
  "C:\Users\jose.albaceto\RenderHtmlFn\saida.png",
  [Convert]::FromBase64String($response.base64)
)
