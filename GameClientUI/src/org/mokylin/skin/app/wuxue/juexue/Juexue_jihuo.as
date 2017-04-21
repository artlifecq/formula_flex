package org.mokylin.skin.app.wuxue.juexue
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.wuxue.juexue.button.ButtonJihuo;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Juexue_jihuo extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_jihuo:feathers.controls.Button;

		public var lb_tiaojian:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Juexue_jihuo()
		{
			super();
			
			this.currentState = "normal";
			this.height = 446;
			this.width = 258;
			this.elementsContent = [__Juexue_jihuo_UIAsset1_i(),__Juexue_jihuo_UIAsset2_i(),lb_tiaojian_i(),btn_jihuo_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Juexue_jihuo_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/juexue/youbeijing.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Juexue_jihuo_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/juexue/jihuotishi.png";
			temp.x = 19;
			temp.y = 84;
			return temp;
		}

		private function btn_jihuo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jihuo = temp;
			temp.name = "btn_jihuo";
			temp.styleClass = org.mokylin.skin.app.wuxue.juexue.button.ButtonJihuo;
			temp.x = 74;
			temp.y = 382;
			return temp;
		}

		private function lb_tiaojian_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_tiaojian = temp;
			temp.name = "lb_tiaojian";
			temp.htmlText = "激活条件：人物等级达到<font color='#5DBD37'>30</font>级";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.x = 32;
			temp.y = 357;
			return temp;
		}

	}
}