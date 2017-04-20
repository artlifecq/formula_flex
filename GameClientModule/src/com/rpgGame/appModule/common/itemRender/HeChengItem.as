package com.rpgGame.appModule.common.itemRender
{
	import com.rpgGame.coreData.enum.HeChengEnum;
	
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.text.Fontter;
	
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJianding;
	
	public class HeChengItem extends Group
	{
		private var _btn:Button;
		public function HeChengItem(btn:Button=null)
		{
			super();
			_btn=btn;
			this.addChild(_btn);
		}
		
		public function SetDate(type:int):void
		{
			switch(type)
			{
				case HeChengEnum.MAIN_TYPE_TUZHI:
					var temp:feathers.controls.Button = new feathers.controls.Button();
					_btn = temp;
					temp.name = "btnTuZhi";
					temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
					temp.leading = 0;
					temp.letterSpacing = 1;
					temp.styleClass = org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJianding;
					temp.color = 0xE1D4A9;
					temp.width = 244;
					temp.height=44;
					temp.x = 0;
					temp.y = 0;
					this.setSize(244,44);
					break;
			}
		}
	}
}