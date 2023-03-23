const cds = require("@sap/cds");
const { Header } = cds.entities("com.schema");

module.exports = (srv) => {

    // ACTION READ
    srv.on("READ", "Header", async (req) => {
        return await SELECT.from(Header);
    });

    // ACTION CREATE
    srv.on("CREATE", "Header", async (req) => {
        let returnData = await cds
            .transaction(req)
            .run(
                INSERT.into(Header).entries({
                    Email: req.data.Email,
                    FirstName: req.data.FirstName,
                    LastName: req.data.LastName,
                    Country: req.data.Country,
                    CreatedOn: req.data.CreatedOn,
                    OrderStatus: req.data.OrderStatus,
                    DeliveryDate: req.data.DeliveryDate,
                    ImageUrl: req.data.ImageUrl
                })
            )
            .then((resolve, reject) => {
                console.log("Resolve", resolve);
                console.log("Reject", reject);

                if (typeof resolve !== "undefined") {
                    return req.data;
                } else {
                    req.error(409, "Registro no insertado");
                }
            })
            .catch((err) => {
                console.log(err);
                req.error(err.code, err.message);
            });
        console.log("Before End", returnData);
        return returnData;
    });

    // ACTION UPDATE
    srv.on("UPDATE", "Header", async (req) => {
        let returnData = await cds
            .transaction(req)
            .run([
                UPDATE(Header, req.data.Email).set({
                    OrderStatus: req.data.OrderStatus
                }),
            ])
            .then((resolve, reject) => {
                console.log("Resolve: ", resolve);
                console.log("Reject: ", reject);

                if (resolve[0] == 0) {
                    req.error(409, "Registro no encontrado");
                }
            })
            .catch((err) => {
                console.log(err);
                req.error(err.code, err.message);
            });
        console.log("Before End", returnData);
        return returnData;
    });

    // ACTION DELETE
    srv.on("DELETE", "Header", async (req) => {
        let returnData = await cds
            .transaction(req)
            .run(
                DELETE.from(Header).where({
                    Email: req.data.Email,
                })
            )
            .then((resolve, reject) => {
                console.log("Resolve", resolve);
                console.log("Reject", reject);
                if (resolve !== 1) {
                    req.error(409, "Registro no encontrado");
                }
            })
            .catch((err) => {
                console.log(err);
                req.error(err.code, err.message);
            });
        console.log("Before End", returnData);
        return await returnData;
    });
};