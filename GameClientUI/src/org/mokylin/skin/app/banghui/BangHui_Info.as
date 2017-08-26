package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.banghui.button.ButtonBh_jineng;
	import org.mokylin.skin.app.banghui.button.ButtonBh_renwu;
	import org.mokylin.skin.app.banghui.button.ButtonBh_zhengba;
	import org.mokylin.skin.app.banghui.button.ButtonFuli;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BangHui_Info extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var NumZhanli:feathers.controls.UINumber;

		public var btnFuli:feathers.controls.Button;

		public var btnJiesan:feathers.controls.Button;

		public var btnJineng:feathers.controls.Button;

		public var btnRenwu:feathers.controls.Button;

		public var btnZhaoji:feathers.controls.Button;

		public var btnZhengba:feathers.controls.Button;

		public var lbBangZhu:feathers.controls.Label;

		public var lbDengji:feathers.controls.Label;

		public var ui_zhandou:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BangHui_Info()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__BangHui_Info_UIAsset2_i(),__BangHui_Info_UIAsset3_i(),btnJiesan_i(),btnZhaoji_i(),lbBangZhu_i(),lbDengji_i(),ui_zhandou_i(),NumZhanli_i(),btnRenwu_i(),btnJineng_i(),btnZhengba_i(),btnFuli_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function NumZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			NumZhanli = temp;
			temp.name = "NumZhanli";
			temp.gap = -15;
			temp.height = 40;
			temp.label = "62984567";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
			temp.textAlign = "left";
			temp.width = 167;
			temp.x = 758;
			temp.y = 468;
			return temp;
		}

		private function __BangHui_Info_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/dibg.png";
			temp.x = 293;
			temp.y = 527;
			return temp;
		}

		private function __BangHui_Info_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/banghui/bg1_right.png";
			temp.x = 290;
			temp.y = 85;
			return temp;
		}

		private function btnFuli_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnFuli = temp;
			temp.name = "btnFuli";
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonFuli;
			temp.x = 862;
			temp.y = 183;
			return temp;
		}

		private function btnJiesan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJiesan = temp;
			temp.name = "btnJiesan";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "解散帮会";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 112;
			temp.x = 802;
			temp.y = 545;
			return temp;
		}

		private function btnJineng_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJineng = temp;
			temp.name = "btnJineng";
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonBh_jineng;
			temp.x = 796;
			temp.y = 339;
			return temp;
		}

		private function btnRenwu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRenwu = temp;
			temp.name = "btnRenwu";
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonBh_renwu;
			temp.x = 735;
			temp.y = 390;
			return temp;
		}

		private function btnZhaoji_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZhaoji = temp;
			temp.name = "btnZhaoji";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "召集成员";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 112;
			temp.x = 683;
			temp.y = 545;
			return temp;
		}

		private function btnZhengba_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZhengba = temp;
			temp.name = "btnZhengba";
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonBh_zhengba;
			temp.x = 832;
			temp.y = 260;
			return temp;
		}

		private function lbBangZhu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBangZhu = temp;
			temp.name = "lbBangZhu";
			temp.text = "名字共六个字";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 334;
			temp.y = 231;
			return temp;
		}

		private function lbDengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDengji = temp;
			temp.name = "lbDengji";
			temp.text = "Lv.68";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 61;
			temp.x = 349;
			temp.y = 271;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/art_txt/common/zhandouli1.png";
			temp.x = 681;
			temp.y = 465;
			return temp;
		}

	}
}