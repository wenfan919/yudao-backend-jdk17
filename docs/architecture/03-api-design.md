# EA API 设计

## KB
- `POST /admin-api/ea/kb/doc/upload`
- `GET /admin-api/ea/kb/doc/page`
- `GET /admin-api/ea/kb/doc/paragraphs`
- `GET /admin-api/ea/kb/doc/search`

## GEN
- `POST /admin-api/ea/gen/run`
- `GET /admin-api/ea/gen/run/page`
- `GET /admin-api/ea/gen/run/{id}`
- `GET /admin-api/ea/gen/run/{id}/logs`
- `POST /admin-api/ea/gen/run/{id}/cancel`
- `POST /admin-api/ea/gen/run/{id}/retry`

## DTO
- `EaGenRunCreateReqVO`
- `EaGenRunRespVO`
- `EaDocPageReqVO`
- `EaDocRespVO`
