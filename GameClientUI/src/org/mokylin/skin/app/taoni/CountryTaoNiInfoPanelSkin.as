package org.mokylin.skin.app.taoni
{
	import feathers.controls.text.Fontter;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_t_tongyonganniu;
	import org.mokylin.skin.component.progress.ProgressBarLvSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryTaoNiInfoPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var currKillCountTxt:feathers.controls.Label;

		public var exitBtn:feathers.controls.Button;

		public var killProGroup1:feathers.controls.Group;

		public var killProGroup2:feathers.controls.Group;

		public var killProInfo:feathers.controls.Group;

		public var killTxtInfo:feathers.controls.Group;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var monsterKillPro1:feathers.controls.ProgressBar;

		public var monsterKillPro2:feathers.controls.ProgressBar;

		public var monsterKillTxt1:feathers.controls.Label;

		public var monsterKillTxt2:feathers.controls.Label;

		public var monsterKillTxt3:feathers.controls.Label;

		public var monsterNamePro1:feathers.controls.Label;

		public var monsterNamePro2:feathers.controls.Label;

		public var monsterNameTxt1:feathers.controls.Label;

		public var monsterNameTxt2:feathers.controls.Label;

		public var monsterNameTxt3:feathers.controls.Label;

		public var monsterProText1:feathers.controls.Label;

		public var monsterProText2:feathers.controls.Label;

		public var monsterTxtGroup1:feathers.controls.Group;

		public var monsterTxtGroup2:feathers.controls.Group;

		public var monsterTxtGroup3:feathers.controls.Group;

		public var nextLevelInfo:feathers.controls.Group;

		public var nextLevelTimeTxt:feathers.controls.Label;

		public var nextStageOpenInfo:feathers.controls.Group;

		public var nextStageOpenTimeTxt:feathers.controls.Label;

		public var stageNameTxt:feathers.controls.Label;

		public var timeTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryTaoNiInfoPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 255;
			labelFilterBlack_i();
			this.elementsContent = [__CountryTaoNiInfoPanelSkin_UIAsset2_i(),__CountryTaoNiInfoPanelSkin_UIAsset3_i(),__CountryTaoNiInfoPanelSkin_Label1_i(),__CountryTaoNiInfoPanelSkin_UIAsset4_i(),__CountryTaoNiInfoPanelSkin_UIAsset5_i(),__CountryTaoNiInfoPanelSkin_UIAsset6_i(),__CountryTaoNiInfoPanelSkin_UIAsset7_i(),__CountryTaoNiInfoPanelSkin_UIAsset8_i(),exitBtn_i(),__CountryTaoNiInfoPanelSkin_Label2_i(),timeTxt_i(),__CountryTaoNiInfoPanelSkin_Label3_i(),stageNameTxt_i(),nextStageOpenInfo_i(),nextLevelInfo_i(),killTxtInfo_i(),killProInfo_i()];
			
			states = {
				init:[
						{target:"monsterKillPro1",
							name:"paddingLeft",
							value:8
						}
						,
						{target:"monsterKillPro2",
							name:"paddingLeft",
							value:8
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CountryTaoNiInfoPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.touchable = false;
			temp.fontSize = 16;
			temp.text = "国家讨逆";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 200;
			temp.x = 25;
			temp.y = 10;
			return temp;
		}

		private function __CountryTaoNiInfoPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "副本倒计时：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 100;
			temp.x = 8;
			temp.y = 45;
			return temp;
		}

		private function __CountryTaoNiInfoPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "当前阶段：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 8;
			temp.y = 86;
			return temp;
		}

		private function __CountryTaoNiInfoPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "下一阶段开启时间：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CountryTaoNiInfoPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "下一波叛军攻击倒计时：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 179;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CountryTaoNiInfoPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "当前击杀叛军：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 112;
			temp.x = 0;
			temp.y = 38;
			return temp;
		}

		private function __CountryTaoNiInfoPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 316;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/di_kuang.png";
			temp.width = 250;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CountryTaoNiInfoPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 35;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/xuan_zhong.png";
			temp.width = 250;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CountryTaoNiInfoPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 1;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/feng_ge_xian.png";
			temp.width = 244;
			temp.x = 3;
			temp.y = 73;
			return temp;
		}

		private function __CountryTaoNiInfoPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 1;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/feng_ge_xian.png";
			temp.width = 244;
			temp.x = 3;
			temp.y = 113;
			return temp;
		}

		private function __CountryTaoNiInfoPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 1;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/feng_ge_xian.png";
			temp.width = 244;
			temp.x = 3;
			temp.y = 153;
			return temp;
		}

		private function __CountryTaoNiInfoPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 1;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/feng_ge_xian.png";
			temp.width = 244;
			temp.x = 3;
			temp.y = 193;
			return temp;
		}

		private function __CountryTaoNiInfoPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 1;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/feng_ge_xian.png";
			temp.width = 244;
			temp.x = 3;
			temp.y = 233;
			return temp;
		}

		private function currKillCountTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			currKillCountTxt = temp;
			temp.name = "currKillCountTxt";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "20/60";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 100;
			temp.y = 38;
			return temp;
		}

		private function exitBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			exitBtn = temp;
			temp.name = "exitBtn";
			temp.height = 34;
			temp.label = "离开副本";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_t_tongyonganniu;
			temp.width = 104;
			temp.x = 74;
			temp.y = 266;
			return temp;
		}

		private function killProGroup1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			killProGroup1 = temp;
			temp.name = "killProGroup1";
			temp.x = 0;
			temp.y = 2;
			temp.elementsContent = [monsterKillPro1_i(),monsterNamePro1_i(),monsterProText1_i()];
			return temp;
		}

		private function killProGroup2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			killProGroup2 = temp;
			temp.name = "killProGroup2";
			temp.x = 0;
			temp.y = 42;
			temp.elementsContent = [monsterKillPro2_i(),monsterProText2_i(),monsterNamePro2_i()];
			return temp;
		}

		private function killProInfo_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			killProInfo = temp;
			temp.name = "killProInfo";
			temp.height = 75;
			temp.width = 230;
			temp.x = 8;
			temp.y = 154;
			temp.elementsContent = [killProGroup1_i(),killProGroup2_i()];
			return temp;
		}

		private function killTxtInfo_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			killTxtInfo = temp;
			temp.name = "killTxtInfo";
			temp.height = 114;
			temp.width = 232;
			temp.x = 8;
			temp.y = 124;
			temp.elementsContent = [monsterTxtGroup1_i(),monsterTxtGroup2_i(),monsterTxtGroup3_i()];
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1;
			temp.blurX = 4;
			temp.blurY = 4;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function monsterKillPro1_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			monsterKillPro1 = temp;
			temp.name = "monsterKillPro1";
			temp.height = 15;
			temp.paddingRight = 8;
			temp.styleClass = org.mokylin.skin.component.progress.ProgressBarLvSkin;
			temp.width = 114;
			temp.x = 116;
			temp.y = 18;
			return temp;
		}

		private function monsterKillPro2_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			monsterKillPro2 = temp;
			temp.name = "monsterKillPro2";
			temp.height = 15;
			temp.paddingRight = 8;
			temp.styleClass = org.mokylin.skin.component.progress.ProgressBarLvSkin;
			temp.width = 114;
			temp.x = 116;
			temp.y = 18;
			return temp;
		}

		private function monsterKillTxt1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			monsterKillTxt1 = temp;
			temp.name = "monsterKillTxt1";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "20/100";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 100;
			temp.x = 132;
			temp.y = 0;
			return temp;
		}

		private function monsterKillTxt2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			monsterKillTxt2 = temp;
			temp.name = "monsterKillTxt2";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "20/100";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 100;
			temp.x = 132;
			temp.y = 0;
			return temp;
		}

		private function monsterKillTxt3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			monsterKillTxt3 = temp;
			temp.name = "monsterKillTxt3";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "20/100";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 100;
			temp.x = 132;
			temp.y = 0;
			return temp;
		}

		private function monsterNamePro1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			monsterNamePro1 = temp;
			temp.name = "monsterNamePro1";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "东侧粮仓完好度：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 0;
			temp.y = 10;
			return temp;
		}

		private function monsterNamePro2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			monsterNamePro2 = temp;
			temp.name = "monsterNamePro2";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "西侧粮仓完好度：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 0;
			temp.y = 8;
			return temp;
		}

		private function monsterNameTxt1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			monsterNameTxt1 = temp;
			temp.name = "monsterNameTxt1";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "击杀山寨守卫：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function monsterNameTxt2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			monsterNameTxt2 = temp;
			temp.name = "monsterNameTxt2";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "击杀山寨小头目：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function monsterNameTxt3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			monsterNameTxt3 = temp;
			temp.name = "monsterNameTxt3";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "击杀山寨首领：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function monsterProText1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			monsterProText1 = temp;
			temp.name = "monsterProText1";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "5000/10000";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 104;
			temp.x = 122;
			temp.y = 0;
			return temp;
		}

		private function monsterProText2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			monsterProText2 = temp;
			temp.name = "monsterProText2";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "5000/10000";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 104;
			temp.x = 122;
			temp.y = 0;
			return temp;
		}

		private function monsterTxtGroup1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			monsterTxtGroup1 = temp;
			temp.name = "monsterTxtGroup1";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [monsterNameTxt1_i(),monsterKillTxt1_i()];
			return temp;
		}

		private function monsterTxtGroup2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			monsterTxtGroup2 = temp;
			temp.name = "monsterTxtGroup2";
			temp.x = 0;
			temp.y = 42;
			temp.elementsContent = [monsterNameTxt2_i(),monsterKillTxt2_i()];
			return temp;
		}

		private function monsterTxtGroup3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			monsterTxtGroup3 = temp;
			temp.name = "monsterTxtGroup3";
			temp.x = 0;
			temp.y = 80;
			temp.elementsContent = [monsterNameTxt3_i(),monsterKillTxt3_i()];
			return temp;
		}

		private function nextLevelInfo_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			nextLevelInfo = temp;
			temp.name = "nextLevelInfo";
			temp.height = 30;
			temp.width = 234;
			temp.x = 8;
			temp.y = 166;
			temp.elementsContent = [__CountryTaoNiInfoPanelSkin_Label5_i(),nextLevelTimeTxt_i(),__CountryTaoNiInfoPanelSkin_Label6_i(),currKillCountTxt_i()];
			return temp;
		}

		private function nextLevelTimeTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nextLevelTimeTxt = temp;
			temp.name = "nextLevelTimeTxt";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "30s";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 164;
			temp.y = 0;
			return temp;
		}

		private function nextStageOpenInfo_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			nextStageOpenInfo = temp;
			temp.name = "nextStageOpenInfo";
			temp.height = 28;
			temp.width = 234;
			temp.x = 8;
			temp.y = 125;
			temp.elementsContent = [__CountryTaoNiInfoPanelSkin_Label4_i(),nextStageOpenTimeTxt_i()];
			return temp;
		}

		private function nextStageOpenTimeTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nextStageOpenTimeTxt = temp;
			temp.name = "nextStageOpenTimeTxt";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "5:00";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 108;
			temp.x = 126;
			temp.y = 0;
			return temp;
		}

		private function stageNameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			stageNameTxt = temp;
			temp.name = "stageNameTxt";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "清澈叛军";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 156;
			temp.x = 78;
			temp.y = 86;
			return temp;
		}

		private function timeTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			timeTxt = temp;
			temp.name = "timeTxt";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "59分59秒";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 90;
			temp.y = 45;
			return temp;
		}

	}
}