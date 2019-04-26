# 

## add storage
mc config host add mcLocal http://127.0.0.1:9000 400P33NBXE2WXQOU7D9L EMjs8ELAHg0bsfs05p9b --api S3v4



## lifecycle

```json
{
   "Rule": {
      "ID": "expire-bucket",
      "Prefix": [],
      "Status": "Enabled",
      "Expiration": {
         "Days": "365"
      }
   }
}
```

```xml
<LifecycleConfiguration>
 <Rule>
   <ID>expire-bucket</ID>
   <Prefix></Prefix>
   <Status>Enabled</Status>
   <Expiration>
     <Days>365</Days>
   </Expiration>
 </Rule>
</LifecycleConfiguration>
```
