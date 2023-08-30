import React, { useState } from 'react'
let ratings = [
    {
        title: "Disatisfied (0%)",
        value: 0
    },
    {
        title: "It was Okay (5%)",
        value: 5
    },
    {
        title: "It was Good (10%)",
        value: 10
    },
    {
        title: "Absolutely Amazing (20%)",
        value: 20
    },




]

const App = () => {
    const [bill, setBill] = useState();
    const [yourRating, setYourRating] = useState(0);
    const [friendRating, setFriendRating] = useState(0);
    const average = Number(Math.round((yourRating + friendRating) / 2));
    const tip = Number(Math.round((average * bill) / 100));

    let total = bill + average;
    return (
        <div>
            How much was the biil ? <input type="number" min={0} id="" value={bill} onChange={(e) => setBill(Number(e.target.value))} /> <br />
            How did you like the service ?  <RateService onRating={setYourRating} /> <br />
            How your friend did like the service ? <RateService onRating={setFriendRating} />
            <div>
                {bill && <h1>You pay {total} Rs <span>{`(${bill}Rs + ${tip}Rs)`}</span></h1>}
            </div>
        </div>

    )
}



const RateService = ({ onRating }) => {
    return <>
        <select name="" id="" onChange={(e) => onRating(Number(e.target.value))}>
            {ratings.map((rating) => <option value={rating.value} key={rating.title}>{rating.title}</option>)}
        </select>
    </>
}


export default App