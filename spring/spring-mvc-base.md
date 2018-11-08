### DispatchServlet
1. 通俗点讲``Handler``是用来干活的工具，``HandlerMapping``是用于根据需要干的活找到相应的工具，而``HandlerAdapter``是使用工具干活的人
2. ``View``是用来展示数据的，而``ViewResolver``是用来查找View的
3. 总结：使用``HandlerMapping``找到干活的``Handler``，找到使用``Handler``的``HandlerAdapter``，让``HandlerAdapter``使用``Handler``干活，干完活后将结果写个报告交上去(通过``View``展示给用户)
