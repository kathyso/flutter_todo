1. Please add a `Todo` button in the `BottomNavigationBar`. And then create a screen that list out the todos. (You can reference to `Posts` to do it)
<img src="https://user-images.githubusercontent.com/15154493/172457312-c5af5c04-a90a-4c21-a674-1f7e528826f1.png" width="300">  


| API | Method |
| ------- | ----------- |
| https://jsonplaceholder.typicode.com/todos?userId=1 | GET |

Response Example:  
```
[
  {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  },
  {
    "userId": 1,
    "id": 2,
    "title": "quis ut nam facilis et officia qui",
    "completed": false
  }
 ]
```

---

2. Please add a `+` button icon in the top right corner in the `AppBar`
<img src="https://user-images.githubusercontent.com/15154493/172458168-752b0fd1-fa10-4a5e-92bf-fffe810ceeab.png" width="300">

---

3. Please create a screen that can let user to create a todo
<img src="https://user-images.githubusercontent.com/15154493/172459593-f1a116e1-7a8d-4bda-87be-be23cfbdff99.png" width="300">


| API | Method |
| ------- | ----------- |
| https://jsonplaceholder.typicode.com/todos | POST |

Request Example:
```
{
    userId: 1,
    title: 'Hello',
}
```

Response Example:  
```
{
    "userId": 1,
    "id": 201,
    "title": "Hello",
    "completed": false
}
```

---

##### Bonus  
1. In the Todo list screen, when user press the checkbox button, call api to update `completed` status and show corresponding UI result of the `completed`.  
(You don't need to base on the response success update the UI because this api is faked. Just based on the last status of the `completed`, then show the opposite value the that `completed`.)
