package org.mokylin.skin.app.zhuangbei.xilian
{
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_left;
	import org.mokylin.skin.app.zhuangbei.xilian.XiLianItem;
	import org.mokylin.skin.app.zhuangbei.xilian.button.ButtonXilian;
	import org.mokylin.skin.component.button.ButtonSkin_shuoming;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Xilian_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Item1:feathers.controls.SkinnableContainer;

		public var Item2:feathers.controls.SkinnableContainer;

		public var btn_shuoming:feathers.controls.Button;

		public var btn_xilian:feathers.controls.Button;

		public var chk_suoding1:feathers.controls.Check;

		public var jiahao:feathers.controls.UIAsset;

		public var lb_cailiao:feathers.controls.Label;

		public var lb_item1:feathers.controls.Label;

		public var lb_item2:feathers.controls.Label;

		public var lb_name1:feathers.controls.Label;

		public var lb_num:feathers.controls.Label;

		public var lb_yuanbao1:feathers.controls.Label;

		public var left:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Xilian_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [__Xilian_Skin_UIAsset3_i(),__Xilian_Skin_UIAsset4_i(),__Xilian_Skin_UIAsset5_i(),btn_shuoming_i(),Item1_i(),Item2_i(),jiahao_i(),__Xilian_Skin_Label1_i(),btn_xilian_i(),left_i(),lb_cailiao_i(),lb_num_i(),lb_item1_i(),lb_item2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Item1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			Item1 = temp;
			temp.name = "Item1";
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.xilian.XiLianItem()
			temp.skin = skin
			temp.x = 406;
			temp.y = 301;
			return temp;
		}

		private function Item2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			Item2 = temp;
			temp.name = "Item2";
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.xilian.XiLianItem()
			temp.skin = skin
			temp.x = 406;
			temp.y = 354;
			return temp;
		}

		private function __Xilian_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.htmlText = "注：洗练除了获得属性外有机会洗练出特殊效果";
			temp.color = 0xD02525;
			temp.x = 504;
			temp.y = 392;
			return temp;
		}

		private function __Xilian_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/xilian/bg.jpg";
			temp.x = 371;
			temp.y = 75;
			return temp;
		}

		private function __Xilian_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/xilian/push_zhuangbei.png";
			temp.x = 474;
			temp.y = 225;
			return temp;
		}

		private function __Xilian_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/xilian/push_cailiao.png";
			temp.x = 730;
			temp.y = 225;
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

		private function btn_xilian_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_xilian = temp;
			temp.name = "btn_xilian";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.xilian.button.ButtonXilian;
			temp.x = 584;
			temp.y = 457;
			return temp;
		}

		private function jiahao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jiahao = temp;
			temp.name = "jiahao";
			temp.styleName = "ui/app/zhuangbei/xilian/jiahao.png";
			temp.x = 607;
			temp.y = 143;
			return temp;
		}

		private function lb_cailiao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_cailiao = temp;
			temp.name = "lb_cailiao";
			temp.text = "初级图鉴图纸";
			temp.color = 0xD02525;
			temp.underline = true;
			temp.x = 818;
			temp.y = 198;
			return temp;
		}

		private function lb_item1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_item1 = temp;
			temp.name = "lb_item1";
			temp.text = "100/1";
			temp.textAlign = "center";
			temp.color = 0xD02525;
			temp.width = 150;
			temp.x = 438;
			temp.y = 97;
			return temp;
		}

		private function lb_item2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_item2 = temp;
			temp.name = "lb_item2";
			temp.text = "100/1";
			temp.textAlign = "center";
			temp.color = 0xD02525;
			temp.width = 150;
			temp.x = 692;
			temp.y = 98;
			return temp;
		}

		private function lb_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_num = temp;
			temp.name = "lb_num";
			temp.text = "100/1";
			temp.textAlign = "right";
			temp.color = 0xD02525;
			temp.width = 70;
			temp.x = 735;
			temp.y = 184;
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