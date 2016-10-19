package org.mokylin.skin.mainui.head
{
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.uinumber.UINumberSkin_yellow_min;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MonsterBoassHeadBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var flag:feathers.controls.UIAsset;

		public var grpBar:feathers.controls.Group;

		public var icon:feathers.controls.UIAsset;

		public var imgLife_0:feathers.controls.UIAsset;

		public var labHP:feathers.controls.Label;

		public var labLevel:feathers.controls.UINumber;

		public var labName:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MonsterBoassHeadBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 120;
			this.width = 643;
			labelFilterBlack_i();
			this.elementsContent = [bg_i(),grpBar_i(),labHP_i(),labName_i(),labLevel_i(),__MonsterBoassHeadBarSkin_UIAsset1_i(),icon_i(),flag_i()];
			
			states = {
				init:[
						{target:"labHP",
							name:"bold",
							value:false
						}
						,
						{target:"labHP",
							name:"textAlign",
							value:"center"
						}
						,
						{target:"labHP",
							name:"color",
							value:0xFFFFFF
						}
						,
						{target:"labName",
							name:"bold",
							value:true
						}
						,
						{target:"labName",
							name:"nativeFilters",
							value:[labelFilterBlack]
						}
						,
						{target:"labName",
							name:"fontName",
							value:"SimHei"
						}
						,
						{target:"labName",
							name:"fontSize",
							value:18
						}
						,
						{target:"labName",
							name:"color",
							value:0xDFB777
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MonsterBoassHeadBarSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/boss/x8.png";
			temp.x = 615;
			temp.y = 70;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 120;
			temp.styleName = "ui/mainui/head/boss/bg.png";
			temp.width = 634;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function flag_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			flag = temp;
			temp.name = "flag";
			temp.height = 88;
			temp.styleName = "ui/mainui/head/boss/flag.png";
			temp.width = 117;
			temp.x = 517;
			temp.y = 28;
			return temp;
		}

		private function grpBar_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpBar = temp;
			temp.name = "grpBar";
			temp.height = 20;
			temp.width = 503;
			temp.x = 102;
			temp.y = 66;
			temp.elementsContent = [imgLife_0_i()];
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.height = 71;
			temp.styleName = "ui/mainui/head/boss/head_icon.png";
			temp.width = 64;
			temp.x = 27;
			temp.y = 36;
			return temp;
		}

		private function imgLife_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLife_0 = temp;
			temp.name = "imgLife_0";
			temp.height = 20;
			temp.styleName = "ui/mainui/head/boss/hong.png";
			temp.width = 503;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labHP_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labHP = temp;
			temp.name = "labHP";
			temp.height = 16;
			temp.text = "1000/1000";
			temp.width = 182;
			temp.x = 236;
			temp.y = 68;
			return temp;
		}

		private function labLevel_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			labLevel = temp;
			temp.name = "labLevel";
			temp.height = 21;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.uinumber.UINumberSkin_yellow_min);
			temp.width = 40;
			temp.x = 127;
			temp.y = 40;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.height = 22;
			temp.text = "名字";
			temp.width = 122;
			temp.x = 164;
			temp.y = 40;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1.00;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 4;
			return temp;
		}

	}
}