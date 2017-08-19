package org.mokylin.skin.app.siwangfuhuo
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongPanelbg2;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class fuhuo_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btn_fuhuodian:feathers.controls.Button;

		public var btn_yuandi:feathers.controls.Button;

		public var lbDanyao:feathers.controls.Label;

		public var lbGoumai:feathers.controls.Label;

		public var lbMianfei:feathers.controls.Label;

		public var lbl_msg:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function fuhuo_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 429;
			this.width = 675;
			this.elementsContent = [bg_i(),__fuhuo_Skin_UIAsset1_i(),__fuhuo_Skin_UIAsset2_i(),__fuhuo_Skin_UIAsset3_i(),lbl_msg_i(),btn_fuhuodian_i(),btn_yuandi_i(),lbDanyao_i(),lbGoumai_i(),lbMianfei_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __fuhuo_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 205;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 643;
			temp.x = 16;
			temp.y = 145;
			return temp;
		}

		private function __fuhuo_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/siwangfuhuo/swfh.png";
			temp.x = 292.5;
			temp.y = 16;
			return temp;
		}

		private function __fuhuo_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/siwangfuhuo/batty.png";
			temp.x = 16;
			temp.y = 81;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 429;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg2()
			temp.skin = skin
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_fuhuodian_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_fuhuodian = temp;
			temp.name = "btn_fuhuodian";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "复活点(30s)";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xFFFFFF;
			temp.width = 125;
			temp.x = 386;
			temp.y = 374;
			return temp;
		}

		private function btn_yuandi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_yuandi = temp;
			temp.name = "btn_yuandi";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "原地复活";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xFFFFFF;
			temp.width = 125;
			temp.x = 166;
			temp.y = 374;
			return temp;
		}

		private function lbDanyao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDanyao = temp;
			temp.name = "lbDanyao";
			temp.text = "还魂丹 0/1";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 173;
			temp.y = 353;
			return temp;
		}

		private function lbGoumai_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbGoumai = temp;
			temp.name = "lbGoumai";
			temp.text = "购买";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 251;
			temp.y = 353;
			return temp;
		}

		private function lbMianfei_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMianfei = temp;
			temp.name = "lbMianfei";
			temp.text = "免费";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 431;
			temp.y = 353;
			return temp;
		}

		private function lbl_msg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_msg = temp;
			temp.name = "lbl_msg";
			temp.htmlText = "你被<font color='#00ff33'>【贪婪的食尸鬼】</font>杀死了（2016年11月10日 15：50：30）";
			temp.color = 0xE1201C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 25;
			temp.y = 119;
			return temp;
		}

	}
}