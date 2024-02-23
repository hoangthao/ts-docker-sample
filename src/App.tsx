import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import env from './env'

function App() {

  console.log('hihi', 
    process.env.NODE_ENV, // default
    process.env.ABC, // pass env variable
    import.meta.env.VITE_SOME_KEY, // config in .env file
    import.meta.env.VITE_SECRETS,
    process.env.SECRETS
  )

  console.log('wr', atob(env.OPS_PASSWORD), atob(env.OPS_API_URL));

  return (
    <>
      <div>
        <a href="https://vitejs.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <span>Hello</span>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <div>
        ${atob(env.OPS_PASSWORD)} ${atob(env.OPS_API_URL)}
      </div>
      
    </>
  )
}

export default App
