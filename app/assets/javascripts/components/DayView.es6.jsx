class DayView extends React.Component {

    dayHandler(){
      this.props.updateCurrentDay(this.props.day);
    }

    mouseEnterHandler(event){
      $(event.target).css("opacity", "0.6");
    }

    mouseLeaveHandler(event){
      $(event.target).css("opacity", "1");
    }

    render(){
      return(
        <div>
          <img onMouseEnter={this.mouseEnterHandler.bind(this)} onMouseLeave={this.mouseLeaveHandler.bind(this)} onClick={this.dayHandler.bind(this)} className="calendar-image" src={this.props.day.image_url}/>
        </div>
      )
    }
  }
