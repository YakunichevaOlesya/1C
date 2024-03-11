
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Запрос = Новый Запрос();
	Запрос.Текст =  "ВЫБРАТЬ
	                |	СправочникНоменклатура.Ссылка КАК Ссылка,
	                |	ОстаткиТоваровОстатки.Номенклатура КАК Номенклатура,
	                |	ЕСТЬNULL(ОстаткиТоваровОстатки.КоличествоОстаток, 0) КАК Количество
	                |ИЗ
	                |	Справочник.Номенклатура КАК СправочникНоменклатура
	                |		ЛЕВОЕ СОЕДИНЕНИЕ РегистрНакопления.ОстаткиТоваров.Остатки КАК ОстаткиТоваровОстатки
	                |		ПО ОстаткиТоваровОстатки.Номенклатура = СправочникНоменклатура.Ссылка";
	Выборка = Запрос.Выполнить().Выбрать();
	Пока Выборка.Следующий() Цикл
	КонецЦикла;
	//Список.КомпоновщикНастроек.Настройки.ДоступныеПоляГруппировок.Элементы
КонецПроцедуры
