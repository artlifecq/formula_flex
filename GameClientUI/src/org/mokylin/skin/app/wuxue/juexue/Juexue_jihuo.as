package org.mokylin.skin.app.wuxue.juexue
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

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
			this.height = 449;
			this.width = 265;
			this.elementsContent = [__Juexue_jihuo_UIAsset1_i(),__Juexue_jihuo_UIAsset2_i(),lb_tiaojian_i(),btn_jihuo_i(),__Juexue_jihuo_UIAsset3_i()];
			
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
			temp.height = 449;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 265;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Juexue_jihuo_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/juexue/youbeijing.jpg";
			temp.x = 3;
			temp.y = 4;
			return temp;
		}

		private function __Juexue_jihuo_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/juexue/wenzi.png";
			temp.x = 21;
			temp.y = 146;
			return temp;
		}

		private function btn_jihuo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jihuo = temp;
			temp.name = "btn_jihuo";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "提前激活";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 110;
			temp.x = 82;
			temp.y = 386;
			return temp;
		}

		private function lb_tiaojian_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_tiaojian = temp;
			temp.name = "lb_tiaojian";
			temp.htmlText = "激活条件：人物等级达到<font color='#5DBD37'>30</font>级";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 34;
			temp.y = 361;
			return temp;
		}

	}
}