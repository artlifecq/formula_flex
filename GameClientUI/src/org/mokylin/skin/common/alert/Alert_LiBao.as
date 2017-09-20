package org.mokylin.skin.common.alert
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Alert_LiBao extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var gBtn:feathers.controls.Group;

		public var grpTime:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var labName:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Alert_LiBao()
		{
			super();
			
			this.currentState = "normal";
			this.height = 267;
			this.width = 326;
			this.elementsContent = [bg_i(),btnClose_i(),__Alert_LiBao_UIAsset1_i(),gBtn_i(),__Alert_LiBao_Group1_i(),icon1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Alert_LiBao_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 9;
			temp.y = 44;
			temp.elementsContent = [labName_i()];
			return temp;
		}

		private function __Alert_LiBao_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/background/libaozhanshi.png";
			temp.x = 119;
			temp.y = 8;
			return temp;
		}

		private function __Alert_LiBao_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/xian_heng.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.bottom = -1;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.top = 0;
			temp.width = 326;
			temp.x = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 290;
			temp.y = 4;
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
			temp.width = 110;
			temp.x = 73;
			temp.y = 51;
			return temp;
		}

		private function gBtn_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gBtn = temp;
			temp.name = "gBtn";
			temp.height = 87;
			temp.width = 263;
			temp.x = 35;
			temp.y = 171;
			temp.elementsContent = [btn_ok_i(),grpTime_i()];
			return temp;
		}

		private function grpTime_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpTime = temp;
			temp.name = "grpTime";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__Alert_LiBao_UIAsset2_i(),lbTime_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 37;
			temp.y = 75;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.htmlText = "提示<font color='#ee0699'>国家BOSS帮派伤害</font>礼包，获得：";
			temp.fontSize = 14;
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 308;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "24秒后自动关闭";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 58;
			temp.y = 11;
			return temp;
		}

	}
}