import express, { request, response } from 'express'
import mysql from 'mysql'
import cors from 'cors'
import { configDB } from './configDB.js'

const db=mysql.createConnection(configDB)
const app=express()
app.use(cors())
app.use(express.json())
const port=8000


//összes kategória:
app.get('/api/categories',(request,response)=>{
    const sql="SELECT * FROM categories order by name"
    console.log(sql);
    
    db.query(sql,(error,result)=>{
            if(error){
                console.log(error);
                response.status(500).json({error:"Adatbázis Hiba!!"})              
            }else{
                response.status(200).send(result)
            }
    })

})

//egy bizonyos kateg. tartozó ételek:
app.get('/api/foodsbycateg/:categId',(request,response)=>{
    const {categId} =request.params
    const sql=`SELECT foods.id,foods.title,foods.photo,foods.price,categories.name 
        from foods,categories where foods.categId=categories.id and categories.id=?`
    const values=[categId]
    //console.log(sql);
    
    db.query(sql,values,(error,result)=>{
            if(error){
                console.log(error);
                response.status(500).json({error:"Adatbázis Hiba!!"})              
            }else{
                response.status(200).send(result)
            }
    })

})

app.get('/api/foodsbysearch/:searchedWord',(request,response)=>{   
    const {searchedWord } =request.params  
    const sql=`SELECT foods.id,foods.title,foods.photo,foods.price,categories.name 
        from foods,categories where foods.categId=categories.id and instr(foods.title,?)>0`        
    const values=[searchedWord]
    db.query(sql,values,(error,result)=>{
            if(error){
                console.log(error);
                response.status(500).json({error:"Adatbázis Hiba!!"})              
            }else if(result.length==0) response.status(404).json({msg:"The search returned no result"})    
            else{
                console.log(result.length);
                
                response.status(200).send(result)
            }
    })

})

app.put('/api/food/:id',(request,response)=>{
    const {id}=request.params
    const {price}=request.body
    const sql=`update foods set price=? where id=?`
    const values=[price,id]
     db.query(sql,values,(error,result)=>{
            if(error){
                console.log(error);
                response.status(500).json({error:"Adatbázis Hiba!!"})              
            }else
                response.status(200).json({msg:"Successfully updated!"})
    })

})

app.post('/api/categories',(request,response)=>{
    const {name,photo,description}=request.body
    const sql=`insert into categories (name,photo,descr) values (?,?,?)`
    const values=[name,photo,description]
     db.query(sql,values,(error,result)=>{
            if(error){
                console.log(error);
                response.status(500).json({error:"Adatbázis Hiba!!"})              
            }else
                response.status(200).json({msg:"Successfully updated!"})
    })

})

app.listen(port,()=>console.log(`server listening on port : ${port}`))