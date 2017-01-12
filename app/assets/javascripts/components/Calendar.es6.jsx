class Calendar extends React.Component {
  constructor(){
    super();
    this.state = {
      days: [],
      currentDay: null,
      date: ''
    }
  }

  componentDidMount(){
    this.setState({
      days: this.props.days,
      currentDay: this.props.currentDay
    })
    this.getDate(this.props.currentDay);
  }

  getDate(day){
    let date = '';
    $.ajax({
      url: '/days/date',
      type: "GET",
      data: {day_id: day.id}
    }).done(answer => {
      this.setState({
        date: answer
      })
    }).fail(function(a,b,c){

    })
  }

  handleToggle(event){
    event.preventDefault();
    if(this.state.currentDay){
      this.setState({
        currentDay: null
      })
    } else {
      this.setState({
        currentDay: this.state.days[this.state.days.length - 1]
      })
    }

  }

  updateCurrentDay(newDay){
    this.setState({
      currentDay: newDay
    })
  }

  render(){
      if(this.state.currentDay){
        return(
          <div>
            <a onClick={this.handleToggle.bind(this)} href='calendar'>calendar</a>
            <h1>{this.state.date}</h1>
            <img src={this.state.currentDay.image_url}/>
          </div>
        )
      } else {
        return(
          <div>
            <a href="" onClick={this.handleToggle.bind(this)}>day</a>
            {this.state.days.map((day,  i) => <div><img className="day-image" src={day.image_url}/></div>)}
          </div>
        )
      }
  }
}
