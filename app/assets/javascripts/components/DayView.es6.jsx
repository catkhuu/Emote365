class DayView extends React.Component {

    dayHandler(){
      this.props.updateCurrentDay(this.props.day);
    }

    render(){
      return(
        <div>
          <img onClick={this.dayHandler.bind(this)} className="calendar-image" src={this.props.day.image_url}/>
        </div>
      )
    }
  }