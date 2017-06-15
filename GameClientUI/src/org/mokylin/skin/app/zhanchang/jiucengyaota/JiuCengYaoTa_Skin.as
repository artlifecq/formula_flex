package org.mokylin.skin.app.zhanchang.jiucengyaota
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhanchang.button.ButtonKaiqi;
	import org.mokylin.skin.app.zhanchang.button.ButtonShengwangbtn;
	import org.mokylin.skin.component.button.ButtonSkin_shuoming2;

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
		public var btnMsg:feathers.controls.Button;

		public var btnOpen:feathers.controls.Button;

		public var btnShengwang:feathers.controls.Button;

		public var grp_icon:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var lbRank:feathers.controls.Label;

		public var lbShengwang:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiuCengYaoTa_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [__JiuCengYaoTa_Skin_UIAsset2_i(),btnOpen_i(),__JiuCengYaoTa_Skin_UIAsset3_i(),__JiuCengYaoTa_Skin_UIAsset4_i(),lbShengwang_i(),btnShengwang_i(),__JiuCengYaoTa_Skin_UIAsset5_i(),__JiuCengYaoTa_Skin_UIAsset6_i(),grp_icon_i(),lbRank_i(),btnMsg_i()];
			
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
			temp.x = 19;
			temp.y = 74;
			return temp;
		}

		private function __JiuCengYaoTa_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/neikuang.png";
			temp.width = 88;
			temp.x = 578;
			temp.y = 541;
			return temp;
		}

		private function __JiuCengYaoTa_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/shengwang.png";
			temp.x = 583;
			temp.y = 539;
			return temp;
		}

		private function __JiuCengYaoTa_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/zhanchangjiangli.png";
			temp.x = 209;
			temp.y = 544;
			return temp;
		}

		private function __JiuCengYaoTa_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/shengwangzhi.png";
			temp.x = 516;
			temp.y = 544;
			return temp;
		}

		private function btnMsg_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMsg = temp;
			temp.name = "btnMsg";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shuoming2;
			temp.x = 902;
			temp.y = 79;
			return temp;
		}

		private function btnOpen_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOpen = temp;
			temp.name = "btnOpen";
			temp.styleClass = org.mokylin.skin.app.zhanchang.button.ButtonKaiqi;
			temp.x = 359;
			temp.y = 464;
			return temp;
		}

		private function btnShengwang_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnShengwang = temp;
			temp.name = "btnShengwang";
			temp.styleClass = org.mokylin.skin.app.zhanchang.button.ButtonShengwangbtn;
			temp.x = 689;
			temp.y = 502;
			return temp;
		}

		private function grp_icon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_icon = temp;
			temp.name = "grp_icon";
			temp.x = 282;
			temp.y = 527;
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

		private function lbRank_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbRank = temp;
			temp.name = "lbRank";
			temp.text = "战场日志 >>";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 844;
			temp.y = 552;
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
			temp.x = 611;
			temp.y = 544;
			return temp;
		}

	}
}