import { CalculateScore } from './Components/CalculateScore';
import './Stylesheets/mystyle.css';

function App() {
    return (
        <div>
            <CalculateScore Name={"Steeve"}
                            School={"DNV Public School"}
                            total={284}
                            goal={3}
            />
        </div>
    );
}

export default App;
