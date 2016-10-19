package org.mokylin.skin.app.crown
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListRedSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class WaiJiaoGuanLiPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lastUnionCountry:feathers.controls.Label;

		public var lastUnionTime:feathers.controls.Label;

		public var list:feathers.controls.List;

		public var unionAmount:feathers.controls.Label;

		public var unionCountry:feathers.controls.Label;

		public var unionState:feathers.controls.Label;

		public var unionTime:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WaiJiaoGuanLiPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__WaiJiaoGuanLiPanelSkin_UIAsset1_i(),__WaiJiaoGuanLiPanelSkin_UIAsset2_i(),__WaiJiaoGuanLiPanelSkin_UIAsset3_i(),__WaiJiaoGuanLiPanelSkin_UIAsset4_i(),__WaiJiaoGuanLiPanelSkin_Label1_i(),unionState_i(),__WaiJiaoGuanLiPanelSkin_Label2_i(),unionCountry_i(),__WaiJiaoGuanLiPanelSkin_Label3_i(),unionTime_i(),__WaiJiaoGuanLiPanelSkin_Label4_i(),unionAmount_i(),__WaiJiaoGuanLiPanelSkin_Label5_i(),lastUnionTime_i(),__WaiJiaoGuanLiPanelSkin_Label6_i(),lastUnionCountry_i(),list_i(),__WaiJiaoGuanLiPanelSkin_UIAsset5_i(),__WaiJiaoGuanLiPanelSkin_UIAsset6_i(),__WaiJiaoGuanLiPanelSkin_UIAsset7_i(),__WaiJiaoGuanLiPanelSkin_UIAsset8_i(),__WaiJiaoGuanLiPanelSkin_UIAsset9_i(),__WaiJiaoGuanLiPanelSkin_UIAsset10_i(),__WaiJiaoGuanLiPanelSkin_Label7_i(),__WaiJiaoGuanLiPanelSkin_Label8_i(),__WaiJiaoGuanLiPanelSkin_Label9_i(),__WaiJiaoGuanLiPanelSkin_Label10_i(),__WaiJiaoGuanLiPanelSkin_Label11_i(),__WaiJiaoGuanLiPanelSkin_Label12_i(),__WaiJiaoGuanLiPanelSkin_Label13_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __WaiJiaoGuanLiPanelSkin_Label10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "本国详情";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 110;
			temp.x = 488;
			temp.y = 23;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_Label11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "国家等级";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 110;
			temp.x = 547;
			temp.y = 143;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_Label12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "当前盟国";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 100;
			temp.x = 657;
			temp.y = 143;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_Label13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "操作";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 88;
			temp.x = 770;
			temp.y = 143;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "结盟状态：";
			temp.color = 0x5B2812;
			temp.width = 108;
			temp.x = 243;
			temp.y = 59;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "当前盟国：";
			temp.color = 0x5B2812;
			temp.width = 108;
			temp.x = 243;
			temp.y = 83;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "结盟时间：";
			temp.color = 0x5B2812;
			temp.width = 108;
			temp.x = 243;
			temp.y = 108;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "盟国好友度：";
			temp.color = 0x5B2812;
			temp.width = 108;
			temp.x = 613;
			temp.y = 108;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "上次结盟时间：";
			temp.color = 0x5B2812;
			temp.width = 108;
			temp.x = 613;
			temp.y = 83;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "上次结盟：";
			temp.color = 0x5B2812;
			temp.width = 108;
			temp.x = 613;
			temp.y = 59;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "国家名称";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 98;
			temp.x = 219;
			temp.y = 143;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "国库资金";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 119;
			temp.x = 316;
			temp.y = 143;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "综合国力";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 110;
			temp.x = 438;
			temp.y = 143;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 520;
			temp.y = 144;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/neikuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/di.png";
			temp.x = 219;
			temp.y = 6;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiaodi.png";
			temp.x = 218;
			temp.y = 14;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/wai_jiao.jpg";
			temp.x = 5;
			temp.y = 5;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiaodi.png";
			temp.x = 218;
			temp.y = 134;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 181;
			temp.y = 144;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 300;
			temp.y = 144;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 410;
			temp.y = 144;
			return temp;
		}

		private function __WaiJiaoGuanLiPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 620;
			temp.y = 144;
			return temp;
		}

		private function lastUnionCountry_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lastUnionCountry = temp;
			temp.name = "lastUnionCountry";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "扬州";
			temp.color = 0x5B2812;
			temp.width = 108;
			temp.x = 686;
			temp.y = 59;
			return temp;
		}

		private function lastUnionTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lastUnionTime = temp;
			temp.name = "lastUnionTime";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "2013-5-5";
			temp.color = 0x239D02;
			temp.width = 108;
			temp.x = 714;
			temp.y = 83;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 308;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 651;
			temp.x = 221;
			temp.y = 171;
			return temp;
		}

		private function unionAmount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			unionAmount = temp;
			temp.name = "unionAmount";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "无";
			temp.color = 0x5B2812;
			temp.width = 108;
			temp.x = 706;
			temp.y = 108;
			return temp;
		}

		private function unionCountry_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			unionCountry = temp;
			temp.name = "unionCountry";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "无";
			temp.color = 0x5B2812;
			temp.width = 108;
			temp.x = 316;
			temp.y = 83;
			return temp;
		}

		private function unionState_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			unionState = temp;
			temp.name = "unionState";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "申请中-益州";
			temp.color = 0x5B2812;
			temp.width = 108;
			temp.x = 316;
			temp.y = 59;
			return temp;
		}

		private function unionTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			unionTime = temp;
			temp.name = "unionTime";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "无";
			temp.color = 0x5B2812;
			temp.width = 108;
			temp.x = 316;
			temp.y = 108;
			return temp;
		}

	}
}