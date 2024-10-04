const express= require("express")
const app= express();

app.get("/",(req, res)=>{
    res.json([
        {
            id:1,
            name:"falgun",
            age:"20"
        },
        {
            id:2,
            name:"user2",
            age:"21"
        },
        {
            id:3,
            name:"user3",
            age:"22"
        },
        {
            id:4,
            name:"user4",
            age:"23"
        }
    ])
});

app.listen(3000,()=>{
    console.log("app is running")
})