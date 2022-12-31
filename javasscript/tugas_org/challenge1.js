let profile = [
    {
        name: 'Jhon',
        email: 'jhon@mail.com',
        active: true
    },
    {
        name: 'Doe',
        email: 'doe@mail.com',
        active: true
    },
    {
        name: 'Jane',
        email: 'jane@mail.com',
        active: true
    }
]

let employee = []

const addProfile = (name, email, active) => {
    return new Promise ((resolve, reject) => {
        const user = {
            name: name,
            email: email,
            active: active
        }
        profile = [
            ...profile,
            user
        ]
        resolve(profile)
    })
}

const addJob = data => {
    return new Promise((resolve, reject) =>{
        employee = data
        resolve(employee)
    })
}

const update = async(name, email, active) => {
    let userProfile = await addProfile(name, email, active)
    let dataEmployee = await addJob(userProfile)

    return dataEmployee
}

update('emil', 'emil@mail.com', true).then(res => console.log(res))
    .catch(e => console.log(e))