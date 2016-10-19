package org.mokylin.skin.mainui.activityBar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.button.ButtonV3_spell_s_left;
	import org.mokylin.skin.component.button.ButtonV3_spell_s_right;
	import org.mokylin.skin.mainui.activityBar.button.ButtonRacing;
	import org.mokylin.skin.mainui.activityBar.button.ButtonTaoni;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ActivityBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCountryWar:feathers.controls.Button;

		public var btnDailyTask:feathers.controls.Button;

		public var btnLeft:feathers.controls.Button;

		public var btnRacing:feathers.controls.Button;

		public var btnRight:feathers.controls.Button;

		public var btnTaoni:feathers.controls.Button;

		public var groupBtn:feathers.controls.Group;

		public var groupRacing:feathers.controls.Group;

		public var groupTaoni:feathers.controls.Group;

		public var lbTimeRacing:feathers.controls.Label;

		public var lbTimeTaoni:feathers.controls.Label;

		public var taoniSurplusNpcTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ActivityBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 100;
			this.width = 489;
			this.elementsContent = [btnLeft_i(),btnRight_i(),groupBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnCountryWar_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCountryWar = temp;
			temp.name = "btnCountryWar";
			temp.label = "国 战";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_green2;
			temp.x = 74;
			temp.y = 1;
			return temp;
		}

		private function btnDailyTask_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDailyTask = temp;
			temp.name = "btnDailyTask";
			temp.label = "日 常";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_green2;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnLeft_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLeft = temp;
			temp.name = "btnLeft";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_spell_s_left;
			temp.x = 452;
			temp.y = 22;
			return temp;
		}

		private function btnRacing_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRacing = temp;
			temp.name = "btnRacing";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.styleClass = org.mokylin.skin.mainui.activityBar.button.ButtonRacing;
			temp.color = 0xF9F0CC;
			temp.x = 7;
			temp.y = 0;
			return temp;
		}

		private function btnRight_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRight = temp;
			temp.name = "btnRight";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_spell_s_right;
			temp.x = 452;
			temp.y = 22;
			return temp;
		}

		private function btnTaoni_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnTaoni = temp;
			temp.name = "btnTaoni";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.styleClass = org.mokylin.skin.mainui.activityBar.button.ButtonTaoni;
			temp.color = 0xF9F0CC;
			temp.x = 16;
			temp.y = 0;
			return temp;
		}

		private function groupBtn_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupBtn = temp;
			temp.name = "groupBtn";
			temp.x = 0;
			temp.y = 13;
			temp.elementsContent = [groupRacing_i(),groupTaoni_i(),btnCountryWar_i(),btnDailyTask_i()];
			return temp;
		}

		private function groupRacing_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupRacing = temp;
			temp.name = "groupRacing";
			temp.x = 350;
			temp.y = 0;
			temp.elementsContent = [lbTimeRacing_i(),btnRacing_i()];
			return temp;
		}

		private function groupTaoni_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupTaoni = temp;
			temp.name = "groupTaoni";
			temp.x = 247;
			temp.y = 0;
			temp.elementsContent = [lbTimeTaoni_i(),btnTaoni_i(),taoniSurplusNpcTxt_i()];
			return temp;
		}

		private function lbTimeRacing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTimeRacing = temp;
			temp.name = "lbTimeRacing";
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "30:30后开始";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 86;
			temp.x = 0;
			temp.y = 60;
			return temp;
		}

		private function lbTimeTaoni_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTimeTaoni = temp;
			temp.name = "lbTimeTaoni";
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "09:55开启";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 90;
			temp.x = 0;
			temp.y = 60;
			return temp;
		}

		private function taoniSurplusNpcTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			taoniSurplusNpcTxt = temp;
			temp.name = "taoniSurplusNpcTxt";
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "100";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 14;
			temp.y = 8;
			return temp;
		}

	}
}