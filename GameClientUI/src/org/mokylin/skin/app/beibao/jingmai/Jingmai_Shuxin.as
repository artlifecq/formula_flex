package org.mokylin.skin.app.beibao.jingmai
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Jingmai_Shuxin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var ib_att1:feathers.controls.Label;

		public var lb_att0:feathers.controls.Label;

		public var titleDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Jingmai_Shuxin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 555;
			this.width = 245;
			this.elementsContent = [bg_i(),titleDisplay_i(),btnClose_i(),__Jingmai_Shuxin_UIAsset1_i(),ib_att1_i(),lb_att0_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Jingmai_Shuxin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/beibao/jingmai/shuxingbeijing.jpg";
			temp.x = 8;
			temp.y = 37;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 555;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 245;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 212;
			temp.y = 7;
			return temp;
		}

		private function ib_att1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			ib_att1 = temp;
			temp.name = "ib_att1";
			temp.htmlText = "攻击：12";
			temp.text = "攻击：12";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 147;
			temp.x = 62;
			temp.y = 355;
			return temp;
		}

		private function lb_att0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_att0 = temp;
			temp.name = "lb_att0";
			temp.htmlText = "攻击：12";
			temp.text = "攻击：12";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 147;
			temp.x = 62;
			temp.y = 93;
			return temp;
		}

		private function titleDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			titleDisplay = temp;
			temp.name = "titleDisplay";
			temp.bold = true;
			temp.height = 26;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.fontSize = 16;
			temp.text = "经脉加成总属性";
			temp.textAlign = "center";
			temp.color = 0xB8AD80;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 210;
			temp.x = 20;
			temp.y = 9;
			return temp;
		}

	}
}