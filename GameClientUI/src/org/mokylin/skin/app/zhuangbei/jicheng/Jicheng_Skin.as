package org.mokylin.skin.app.zhuangbei.jicheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_left;
	import org.mokylin.skin.app.zhuangbei.jicheng.button.ButtonJicheng;
	import org.mokylin.skin.component.button.ButtonSkin_shuoming;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Jicheng_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_jicheng:feathers.controls.Button;

		public var btn_shuoming:feathers.controls.Button;

		public var left:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Jicheng_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [left_i(),__Jicheng_Skin_UIAsset3_i(),btn_shuoming_i(),__Jicheng_Skin_UIAsset4_i(),__Jicheng_Skin_UIAsset5_i(),__Jicheng_Skin_Group1_i(),__Jicheng_Skin_Label1_i(),__Jicheng_Skin_Label2_i(),btn_jicheng_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Jicheng_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 591;
			temp.y = 99;
			temp.elementsContent = [__Jicheng_Skin_UIAsset6_i(),__Jicheng_Skin_UIAsset7_i(),__Jicheng_Skin_UIAsset8_i()];
			return temp;
		}

		private function __Jicheng_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "同部位的装备才可以继承";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 581;
			temp.y = 184;
			return temp;
		}

		private function __Jicheng_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "继承完成后消耗装备将会消失";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 569;
			temp.y = 201;
			return temp;
		}

		private function __Jicheng_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/jicheng/bg.jpg";
			temp.x = 371;
			temp.y = 75;
			return temp;
		}

		private function __Jicheng_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/jicheng/cailiao.png";
			temp.x = 470;
			temp.y = 193;
			return temp;
		}

		private function __Jicheng_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/jicheng/jieguo.png";
			temp.x = 739;
			temp.y = 193;
			return temp;
		}

		private function __Jicheng_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/jicheng/jiantou.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Jicheng_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/jicheng/jiantou.png";
			temp.x = 38;
			temp.y = 0;
			return temp;
		}

		private function __Jicheng_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/jicheng/jiantou.png";
			temp.x = 77;
			temp.y = 0;
			return temp;
		}

		private function btn_jicheng_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jicheng = temp;
			temp.name = "btn_jicheng";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.jicheng.button.ButtonJicheng;
			temp.x = 596;
			temp.y = 473;
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

		private function left_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			left = temp;
			temp.name = "left";
			temp.height = 431;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.Zhuangbei_left()
			temp.skin = skin
			temp.width = 340;
			temp.x = 23;
			temp.y = 79;
			return temp;
		}

	}
}