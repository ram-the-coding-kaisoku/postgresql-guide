# SELECT
This section will be a quick guide on select statements.  

{"type":"excalidraw/clipboard","elements":[{"id":"TvPx2xnry8z64CS8cqwPc","type":"rectangle","x":-251.27919589013652,"y":-7.516584647243974,"width":283.00236564413956,"height":130.1160814389517,"angle":0,"strokeColor":"#1e1e1e","backgroundColor":"#a5d8ff","fillStyle":"solid","strokeWidth":2,"strokeStyle":"solid","roughness":1,"opacity":100,"groupIds":[],"frameId":null,"index":"aj","roundness":{"type":3},"seed":1729356643,"version":124,"versionNonce":1130002029,"isDeleted":false,"boundElements":[{"type":"text","id":"mTAAqeUEY3rf0N1OZaRuE"},{"id":"fAW-Gg1jj2SHFLJrL-qu2","type":"arrow"}],"updated":1778826280733,"link":null,"locked":false},{"id":"mTAAqeUEY3rf0N1OZaRuE","type":"text","x":-162.5179956730472,"y":35.04145607223188,"width":105.47996520996094,"height":45,"angle":0,"strokeColor":"#1e1e1e","backgroundColor":"#a5d8ff","fillStyle":"solid","strokeWidth":2,"strokeStyle":"solid","roughness":1,"opacity":100,"groupIds":[],"frameId":null,"index":"ak","roundness":null,"seed":1259057453,"version":78,"versionNonce":1631734541,"isDeleted":false,"boundElements":null,"updated":1778826263467,"link":null,"locked":false,"text":"FROM","fontSize":36,"fontFamily":5,"textAlign":"center","verticalAlign":"middle","containerId":"TvPx2xnry8z64CS8cqwPc","originalText":"FROM","autoResize":true,"lineHeight":1.25},{"id":"Nn-CASCqn9Q1jFZBK_UwK","type":"rectangle","x":233.40298934599645,"y":-9.143013852834656,"width":283.00236564413956,"height":130.1160814389517,"angle":0,"strokeColor":"#1e1e1e","backgroundColor":"#b2f2bb","fillStyle":"solid","strokeWidth":2,"strokeStyle":"solid","roughness":1,"opacity":100,"groupIds":[],"frameId":null,"index":"al","roundness":{"type":3},"seed":2009185987,"version":155,"versionNonce":1628787459,"isDeleted":false,"boundElements":[{"type":"text","id":"RgteiyXB_i_DMI-AQJtBz"},{"id":"fAW-Gg1jj2SHFLJrL-qu2","type":"arrow"}],"updated":1778826285927,"link":null,"locked":false},{"id":"RgteiyXB_i_DMI-AQJtBz","type":"text","x":322.16418956308576,"y":33.4150268666412,"width":105.47996520996094,"height":45,"angle":0,"strokeColor":"#1e1e1e","backgroundColor":"#a5d8ff","fillStyle":"solid","strokeWidth":2,"strokeStyle":"solid","roughness":1,"opacity":100,"groupIds":[],"frameId":null,"index":"am","roundness":null,"seed":524480099,"version":108,"versionNonce":2040134307,"isDeleted":false,"boundElements":[],"updated":1778826285927,"link":null,"locked":false,"text":"FROM","fontSize":36,"fontFamily":5,"textAlign":"center","verticalAlign":"middle","containerId":"Nn-CASCqn9Q1jFZBK_UwK","originalText":"FROM","autoResize":true,"lineHeight":1.25},{"id":"fAW-Gg1jj2SHFLJrL-qu2","type":"arrow","x":37.723169754003045,"y":57.506081206938404,"width":189.6798195919934,"height":1.5296562587159173,"angle":0,"strokeColor":"#1e1e1e","backgroundColor":"#b2f2bb","fillStyle":"solid","strokeWidth":2,"strokeStyle":"solid","roughness":1,"opacity":100,"groupIds":[],"frameId":null,"index":"an","roundness":null,"seed":66039629,"version":44,"versionNonce":1449700931,"isDeleted":false,"boundElements":null,"updated":1778826285928,"link":null,"locked":false,"points":[[0,0],[189.6798195919934,-1.5296562587159173]],"startBinding":{"elementId":"TvPx2xnry8z64CS8cqwPc","mode":"orbit","fixedPoint":[1,0.5001]},"endBinding":{"elementId":"Nn-CASCqn9Q1jFZBK_UwK","mode":"orbit","fixedPoint":[0,0.5001]},"startArrowhead":null,"endArrowhead":"arrow","elbowed":false,"moveMidPointsWithElement":false}],"files":{}}

### select all columns.
```sql
SELECT * FROM customer;
```
> [!CAUTION]
> using * in production queries is not recommended, only for adhoc queries, select should only retrive what application needs nothing more.

### select specific columns.
```sql
SELECT customer_id, first_name FROM customer;
```
### select with expression.
```sql
SELECT customer_id, first_name ||' '||last_name
FROM customer;
```
- This will concatenate the columns but note the column name will be unknow, to avoid that use alias.

### Alias
```sql
SELECT customer_id, first_name ||' '||last_name AS "Full name"
FROM customer;
```
- AS clause is optional we can simply mention the alias name, "" is needed when white spaces are included.

### Without FROM clause.
```sql
SELECT now();
```
- FROM clause is optional.