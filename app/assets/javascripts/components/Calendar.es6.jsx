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
            {this.state.days.map(function(day, index){

            })}
            <a href="" onClick={this.handleToggle.bind(this)}>day</a>
          </div>
        )
      }
  }
}
