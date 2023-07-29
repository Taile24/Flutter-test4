# tài liệu tham khảo

1. cài đặt: https://docs.flutter.dev/get-started/install

2. cài fron chữ : flutter pub add google_fonts
3. cài chức năng thêm hình ảnh : flutter pub add transparent_image
4. cài thêm chức năng : flutter pub add flutter_riverpod

# tạo thanh menu ngang

```c
BottomNavigationBarItem(
            icon: Icon(Icons.verified_user_outlined),
            label: 'Taile',
          ),
```

# Tạo danh sách

```c
InkWell(borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
),

```

# tạo thanh tích trong setting

```c
SwitchListTile(
            value: _veganFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _veganFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
```

# Tạo thanh Menu

```c
Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
      ),
      ),
      ]),
),
```

# tạo

# Tạo kiểu văn bản

```c
Text('tài đẹp trai',styde:const TextStyle(color: Colors.white))



```
