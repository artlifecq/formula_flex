package org.mokylin.skin.app.siwangfuhuo
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongPanelbg2;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
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

		public var btn_goumai:feathers.controls.Button;

		public var btn_yuandi:feathers.controls.Button;

		public var lbl_msg:feathers.controls.Label;

		public var lbl_time:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function fuhuo_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 415;
			this.elementsContent = [bg_i(),__fuhuo_Skin_UIAsset1_i(),__fuhuo_Skin_UIAsset2_i(),__fuhuo_Skin_UIAsset3_i(),lbl_msg_i(),lbl_time_i(),btn_fuhuodian_i(),btn_yuandi_i(),btn_goumai_i()];
			
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
			temp.height = 415;
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
			temp.label = "返回复活点复活";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xFFFFFF;
			temp.width = 129;
			temp.x = 400;
			temp.y = 362;
			return temp;
		}

		private function btn_goumai_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_goumai = temp;
			temp.name = "btn_goumai";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "购买还魂丹";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xFFFFFF;
			temp.width = 101;
			temp.x = 213;
			temp.y = 362;
			return temp;
		}

		private function btn_yuandi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_yuandi = temp;
			temp.name = "btn_yuandi";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "使用还魂丹原地复活";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xFFFFFF;
			temp.width = 151;
			temp.x = 53;
			temp.y = 362;
			return temp;
		}

		private function lbl_msg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_msg = temp;
			temp.name = "lbl_msg";
			temp.htmlText = "你被<font color='#5DBD37'>【贪婪的食尸鬼】</font>杀死了（2016年11月10日 15：50：30）";
			temp.color = 0xe1201c;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 25;
			temp.y = 119;
			return temp;
		}

		private function lbl_time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_time = temp;
			temp.name = "lbl_time";
			temp.text = "剩余：28秒";
			temp.color = 0xe8c857;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 96;
			temp.x = 537;
			temp.y = 371;
			return temp;
		}

	}
}