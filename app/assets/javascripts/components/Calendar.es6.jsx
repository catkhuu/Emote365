class Calendar extends React.Component {
  constructor(){
    super();
    this.state = {
      days: [],
      currentDay: null
    }
  }


  handleToggle(event){
    event.preventDefault();
  }

  render(){
      if(this.state.currentDay){
        return(
          <div>
            <h1>Day</h1>
            <a href=''>day</a>
            <img onClick={this.handleToggle.bind(this)} src={this.state.currentDay.image_url}></img>
          </div>
        )
      } else {
        return(
          <div>
            <h1>Day</h1>
            <a href="" onClick={this.handleToggle.bind(this)}>calendar</a>
          </div>
        )
      }
  }
}
