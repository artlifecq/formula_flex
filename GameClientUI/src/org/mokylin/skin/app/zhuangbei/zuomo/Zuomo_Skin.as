package org.mokylin.skin.app.zhuangbei.zuomo
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_left;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_shuoming;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Zuomo_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_shuoming:feathers.controls.Button;

		public var btn_zuomo:feathers.controls.Button;

		public var lb_name:feathers.controls.Label;

		public var left:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zuomo_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [left_i(),__Zuomo_Skin_UIAsset4_i(),btn_shuoming_i(),lb_name_i(),btn_zuomo_i(),__Zuomo_Skin_UIAsset5_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Zuomo_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/zuomo/bg.jpg";
			temp.visible = false;
			temp.x = 371;
			temp.y = 75;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/zuomo/daojukuang.png";
			temp.x = 539;
			temp.y = 76;
			return temp;
		}

		private function btn_shuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuoming = temp;
			temp.name = "btn_shuoming";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shuoming;
			temp.x = 834;
			temp.y = 83;
			return temp;
		}

		private function btn_zuomo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zuomo = temp;
			temp.name = "btn_zuomo";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "琢 磨";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.width = 77;
			temp.x = 605;
			temp.y = 264;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.text = "装备名字";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 123;
			temp.x = 584;
			temp.y = 144;
			return temp;
		}

		private function left_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			left = temp;
			temp.name = "left";
			temp.height = 431;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.Zhuangbei_left()
			temp.skin = skin
			temp.visible = false;
			temp.width = 340;
			temp.x = 23;
			temp.y = 79;
			return temp;
		}

	}
}