package org.mokylin.skin.app.zhanchang.jiucengyaota
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhanchang.button.ButtonKaiqi;
	import org.mokylin.skin.app.zhanchang.button.ButtonShengwangbtn;
	import org.mokylin.skin.app.zhanchang.jiucengyaota.Tips_yaota;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiuCengYaoTa_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnOpen:feathers.controls.Button;

		public var btnShengwang:feathers.controls.Button;

		public var grp_icon:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var iconSw:feathers.controls.UIAsset;

		public var lbRank:feathers.controls.Label;

		public var lbShengwang:feathers.controls.Label;

		public var skinTips:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiuCengYaoTa_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__JiuCengYaoTa_Skin_UIAsset2_i(),btnOpen_i(),__JiuCengYaoTa_Skin_UIAsset3_i(),iconSw_i(),lbShengwang_i(),btnShengwang_i(),__JiuCengYaoTa_Skin_UIAsset4_i(),__JiuCengYaoTa_Skin_UIAsset5_i(),grp_icon_i(),lbRank_i(),skinTips_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiuCengYaoTa_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zhanchang/yaota_bg.jpg";
			temp.x = 23;
			temp.y = 87;
			return temp;
		}

		private function __JiuCengYaoTa_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/neikuang.png";
			temp.width = 88;
			temp.x = 706;
			temp.y = 555;
			return temp;
		}

		private function __JiuCengYaoTa_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/zhanchangjiangli.png";
			temp.x = 51;
			temp.y = 557;
			return temp;
		}

		private function __JiuCengYaoTa_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/shengwangzhi.png";
			temp.x = 651;
			temp.y = 557;
			return temp;
		}

		private function btnOpen_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOpen = temp;
			temp.name = "btnOpen";
			temp.styleClass = org.mokylin.skin.app.zhanchang.button.ButtonKaiqi;
			temp.x = 366;
			temp.y = 479;
			return temp;
		}

		private function btnShengwang_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnShengwang = temp;
			temp.name = "btnShengwang";
			temp.styleClass = org.mokylin.skin.app.zhanchang.button.ButtonShengwangbtn;
			temp.x = 840;
			temp.y = 524;
			return temp;
		}

		private function grp_icon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_icon = temp;
			temp.name = "grp_icon";
			temp.x = 119;
			temp.y = 542;
			temp.elementsContent = [icon1_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function iconSw_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconSw = temp;
			temp.name = "iconSw";
			temp.styleName = "ui/common/tubiao/shengwang.png";
			temp.x = 711;
			temp.y = 553;
			return temp;
		}

		private function lbRank_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbRank = temp;
			temp.name = "lbRank";
			temp.text = "战场日志";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 840;
			temp.y = 502;
			return temp;
		}

		private function lbShengwang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShengwang = temp;
			temp.name = "lbShengwang";
			temp.text = "1000";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 739;
			temp.y = 558;
			return temp;
		}

		private function skinTips_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinTips = temp;
			temp.name = "skinTips";
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.jiucengyaota.Tips_yaota()
			temp.skin = skin
			temp.x = 550;
			temp.y = 223;
			return temp;
		}

	}
}