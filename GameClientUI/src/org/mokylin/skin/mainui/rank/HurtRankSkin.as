package org.mokylin.skin.mainui.rank
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
	import org.mokylin.skin.component.list.ListSkin3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HurtRankSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var bgTitle:feathers.controls.UIAsset;

		public var btnGoTo:feathers.controls.Button;

		public var headingBg:feathers.controls.UIAsset;

		public var headingLine1:feathers.controls.UIAsset;

		public var headingLine2:feathers.controls.UIAsset;

		public var lbCountDown:feathers.controls.Label;

		public var lbHeading1:feathers.controls.Label;

		public var lbHeading2:feathers.controls.Label;

		public var lbHeading3:feathers.controls.Label;

		public var lbTitle:feathers.controls.Label;

		public var line0:feathers.controls.UIAsset;

		public var line1:feathers.controls.UIAsset;

		public var list:feathers.controls.List;

		public var myHurtTxt:feathers.controls.Label;

		public var myRankTxt:feathers.controls.Label;

		public var titleDecorate:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HurtRankSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 385;
			this.width = 260;
			this.elementsContent = [bg_i(),bgTitle_i(),titleDecorate_i(),lbTitle_i(),line0_i(),lbCountDown_i(),headingBg_i(),lbHeading1_i(),lbHeading2_i(),lbHeading3_i(),headingLine1_i(),headingLine2_i(),list_i(),line1_i(),btnGoTo_i(),myHurtTxt_i(),myRankTxt_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bgTitle_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgTitle = temp;
			temp.name = "bgTitle";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title.png";
			temp.x = 7;
			temp.y = 2;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 385;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/di_kuang.png";
			temp.width = 260;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnGoTo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGoTo = temp;
			temp.name = "btnGoTo";
			temp.height = 32;
			temp.label = "寻找弼马温";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
			temp.width = 100;
			temp.x = 145;
			temp.y = 346;
			return temp;
		}

		private function headingBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headingBg = temp;
			temp.name = "headingBg";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title-bg.png";
			temp.width = 255;
			temp.x = 2;
			temp.y = 45;
			return temp;
		}

		private function headingLine1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headingLine1 = temp;
			temp.name = "headingLine1";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title-fenge.png";
			temp.x = 51;
			temp.y = 45;
			return temp;
		}

		private function headingLine2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headingLine2 = temp;
			temp.name = "headingLine2";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title-fenge.png";
			temp.x = 173;
			temp.y = 45;
			return temp;
		}

		private function lbCountDown_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCountDown = temp;
			temp.name = "lbCountDown";
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "活动倒计时";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 260;
			temp.x = 0;
			temp.y = 26;
			return temp;
		}

		private function lbHeading1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeading1 = temp;
			temp.name = "lbHeading1";
			temp.text = "排名";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 13;
			temp.y = 48;
			return temp;
		}

		private function lbHeading2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeading2 = temp;
			temp.name = "lbHeading2";
			temp.text = "姓名";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 98;
			temp.y = 48;
			return temp;
		}

		private function lbHeading3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeading3 = temp;
			temp.name = "lbHeading3";
			temp.text = "伤害";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 202;
			temp.y = 48;
			return temp;
		}

		private function lbTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTitle = temp;
			temp.name = "lbTitle";
			temp.fontSize = 16;
			temp.text = "伤害排名";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 260;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function line0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line0 = temp;
			temp.name = "line0";
			temp.height = 3;
			temp.styleName = "ui/common/tip/equipTips/dikuang/taitoufengexian.png";
			temp.width = 255;
			temp.x = 2;
			temp.y = 40;
			return temp;
		}

		private function line1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line1 = temp;
			temp.name = "line1";
			temp.height = 3;
			temp.styleName = "ui/common/tip/equipTips/dikuang/taitoufengexian.png";
			temp.width = 255;
			temp.x = 2;
			temp.y = 340;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 264;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin3;
			temp.width = 259;
			temp.x = 0;
			temp.y = 70;
			return temp;
		}

		private function myHurtTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			myHurtTxt = temp;
			temp.name = "myHurtTxt";
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "我的伤害：9999";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 170;
			temp.x = 10;
			temp.y = 344;
			return temp;
		}

		private function myRankTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			myRankTxt = temp;
			temp.name = "myRankTxt";
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "我的排名：11";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 10;
			temp.y = 362;
			return temp;
		}

		private function titleDecorate_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			titleDecorate = temp;
			temp.name = "titleDecorate";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/hua_wen.png";
			temp.x = 58;
			temp.y = -5;
			return temp;
		}

	}
}