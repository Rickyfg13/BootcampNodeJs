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
    setTimeout(() => {
        const user = {
            name: name,
            email: email,
            active: active
        }
        profile = [
            ...profile,
            user
        ]
        return profile
    }, 3000)
}

const addJob = () => {
    setTimeout(() => {
        employee = profile
        return employee
    }, 4000)
}


const update = async(name, email, active) => {
    let userProfile = await addProfile(name, email, active)
    let dataEmployee = await addJob()

    return [userProfile, dataEmployee]
}
update('emil', 'emil@mail.com', true).then(res => console.log(res))
    .catch(e => console.log(e))
