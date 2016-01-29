angular.module 'fthat'
  .controller 'MainController', ($timeout, webDevTec, toastr) ->
    'ngInject'
    vm = this

    vm.total = 0
    vm.hours = ''
    vm.minutes = ''
    vm.months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"]

    vm.calculate =
      time : (time) ->
        vm.hours = new Date(time).getHours()
        vm.minutes = new Date(time).getMinutes()

      total : (rate) ->
        vm.total = (vm.hours + (((10 * vm.minutes) / 6) / 100)) * rate if rate


    vm.getWeekdaysInMonth = (month, year) ->
      daysInMonth = (iMonth, iYear) ->
        return 32 - new Date(iYear, iMonth, 32).getDate()


      isWeekday = (iDay, iMonth, iYear) ->
        newday = new Date(iYear, iMonth, iDay).getDay()
        newday != 0 && newday != 6;

      days = daysInMonth(month - 1, year)
      weekdays = 0;
      i = 0
      while i < days
        if isWeekday(i + 1, month - 1, year)
          weekdays++
        i++
      weekdays


    # End of controller
    return
