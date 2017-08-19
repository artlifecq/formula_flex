package org.mokylin.skin.app.shangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ChuShou_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var btn_cancel:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var chk_ok:feathers.controls.Check;

		public var imgIocn:feathers.controls.UIAsset;

		public var lbName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ChuShou_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 264;
			this.width = 326;
			this.elementsContent = [bg_i(),btnClose_i(),btn_ok_i(),btn_cancel_i(),__ChuShou_Skin_Label1_i(),lbName_i(),__ChuShou_Skin_Label2_i(),chk_ok_i(),imgIocn_i(),__ChuShou_Skin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ChuShou_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "该物品价值较高，是否确认出售？";
			temp.color = 0xcfc6ae;
			temp.x = 60;
			temp.y = 148;
			return temp;
		}

		private function __ChuShou_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "本次登陆不再提示";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 127;
			temp.y = 173;
			return temp;
		}

		private function __ChuShou_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/background/head_tishi.png";
			temp.x = 142;
			temp.y = 9;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 264;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.width = 326;
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
			temp.x = 293;
			temp.y = 5;
			return temp;
		}

		private function btn_cancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_cancel = temp;
			temp.name = "btn_cancel";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "取 消";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 181;
			temp.y = 216;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "确 认";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 57;
			temp.y = 216;
			return temp;
		}

		private function chk_ok_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_ok = temp;
			temp.name = "chk_ok";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 101;
			temp.y = 171;
			return temp;
		}

		private function imgIocn_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgIocn = temp;
			temp.name = "imgIocn";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 128;
			temp.y = 68;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "该物品价值";
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 101;
			temp.x = 118;
			temp.y = 48;
			return temp;
		}

	}
}