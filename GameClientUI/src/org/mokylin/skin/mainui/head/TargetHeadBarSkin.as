package org.mokylin.skin.mainui.head
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_vip;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TargetHeadBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnVip:feathers.controls.Button;

		public var imgJob:feathers.controls.UIAsset;

		public var imgLife:feathers.controls.UIAsset;

		public var labHP:feathers.controls.Label;

		public var labLevel:feathers.controls.Label;

		public var labName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TargetHeadBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 65;
			this.width = 188;
			this.elementsContent = [__TargetHeadBarSkin_UIAsset1_i(),imgLife_i(),btnVip_i(),labHP_i(),labName_i(),labLevel_i(),imgJob_i()];
			
			states = {
				normal:[
					]
				,
				disabled:[
					]
				,
				init:[
						{target:"labHP",
							name:"bold",
							value:true
						}
						,
						{target:"labHP",
							name:"align",
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
							name:"color",
							value:0xDFB777
						}
						,
						{target:"labLevel",
							name:"bold",
							value:true
						}
						,
						{target:"labLevel",
							name:"align",
							value:"center"
						}
						,
						{target:"labLevel",
							name:"color",
							value:0xDED8C7
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TargetHeadBarSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/zuduitouxiangkuang.png";
			temp.x = 1;
			temp.y = 5;
			return temp;
		}

		private function btnVip_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnVip = temp;
			temp.name = "btnVip";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_vip);
			temp.x = 142;
			temp.y = 0;
			return temp;
		}

		private function imgJob_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgJob = temp;
			temp.name = "imgJob";
			temp.styleName = "ui/mainui/head/job/fashizhiyedatu.png";
			temp.x = 60;
			temp.y = 39;
			return temp;
		}

		private function imgLife_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLife = temp;
			temp.name = "imgLife";
			temp.styleName = "ui/mainui/head/zuduitouxiangkuangxuetiao.png";
			temp.width = 110;
			temp.x = 45;
			temp.y = 22;
			return temp;
		}

		private function labHP_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labHP = temp;
			temp.name = "labHP";
			temp.height = 16;
			temp.text = "1000/1000";
			temp.width = 110;
			temp.x = 44;
			temp.y = 20;
			return temp;
		}

		private function labLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLevel = temp;
			temp.name = "labLevel";
			temp.height = 16;
			temp.text = "85";
			temp.width = 25;
			temp.x = 0;
			temp.y = 30;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.text = "名字";
			temp.width = 87;
			temp.x = 45;
			temp.y = 5;
			return temp;
		}

	}
}