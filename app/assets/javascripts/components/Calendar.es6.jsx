class Calendar extends React.Component {
  constructor(){
    super();
    this.state = {
      days: [],
      currentDay: null
    }
  }

  componentDidMount(){
    this.setState({
      days: this.props.days,
      currentDay: this.props.currentDay
    })
  }


  handleToggle(event){
    event.preventDefault();
  }

  updateCurrentDay(newDay){
    this.setState({
      currentDay: newDay
    })
  }

  render(){
    debugger
      if(this.state.currentDay){
        return(
          <div>
            <a onClick={this.handleToggle.bind(this)} href='calendar'>calendar</a>
            <h1>{this.props.currentDay.created_at}</h1>
            <img src={this.state.currentDay.image_url}/>
          </div>
        )
      } else {
        return(
          <div>
            {this.state.days.map(function(day, index){

            })}
            <a href="" onClick={this.handleToggle.bind(this)}>day</a>
          </div>
        )
      }
  }
}
