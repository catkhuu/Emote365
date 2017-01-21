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

  nextDay(){
    let dayId = this.state.currentDay.id;
    let newDay = {};
    for(var index in this.state.days){
      if(this.state.days[index].id === dayId + 1){
        newDay = this.state.days[index];
        this.updateCurrentDay(newDay);
        this.getDate(newDay);
      }
    }
  }

  previousDay(){
    let dayId = this.state.currentDay.id;
    let newDay = {};
    for(var index in this.state.days){
      if(this.state.days[index].id === dayId - 1){
        newDay = this.state.days[index];
        this.updateCurrentDay(newDay);
        this.getDate(newDay);
      }
    }
  }

  render(){
      if(this.state.currentDay){
        return(
          <div>
            <a onClick={this.handleToggle.bind(this)} href='calendar'>calendar view</a>
            <div id="day-wrapper">
              <div onClick={this.previousDay.bind(this)} className="controls previous">
                <i className="fa fa-angle-left"></i>
              </div>
              <h1 className="date">{this.state.date}</h1>
              <img className="day-image" src={this.state.currentDay.image_url}/>
              <div onClick={this.nextDay.bind(this)} className="controls next">
                <i className="fa fa-angle-right"></i>
              </div>
          </div>
        </div>
        )
      } else {
        return(
          <div>
            <a href="" onClick={this.handleToggle.bind(this)}>day view</a>
            {this.state.days.map((day,  i) => <DayView updateCurrentDay={this.updateCurrentDay.bind(this)} key={i} day={day}/>)}
          </div>
        )
      }
  }
}
