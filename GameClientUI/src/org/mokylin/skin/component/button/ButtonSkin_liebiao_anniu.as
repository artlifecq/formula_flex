package org.mokylin.skin.component.button
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_liebiao_anniu extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_liebiao_anniu()
		{
			super();
			
			this.currentState = "down";
			this.height = 20;
			this.elementsContent = [];
			
			states = {
				down:[
						{target:"labelDisplay",
							name:"color",
							value:0x8D6945
						}
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0xFFE258
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"color",
							value:0xF9F0CC
						}
					]
				,
				disabled:[
						{target:"labelDisplay",
							name:"color",
							value:0xABA49E
						}
						,
						{target:"labelDisplay",
							name:"left",
							value:-1
						}
						,
						{target:"labelDisplay",
							name:"right",
							value:1
						}
						,
						{target:"labelDisplay",
							name:"top",
							value:-2
						}
						,
						{target:"labelDisplay",
							name:"bottom",
							value:2
						}
					]
				,
				init:[
						{target:"labelDisplay",
							name:"textAlign",
							value:"center"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xF9F0CC
						}
						,
						{target:"labelDisplay",
							name:"verticalAlign",
							value:"middle"
						}
					]
			};
			skinNames={"disabled":"ui/component/button/skin_liebiao_anniu/disabled.png",
			"down":"ui/component/button/skin_liebiao_anniu/down.png",
			"hover":"ui/component/button/skin_liebiao_anniu/over.png",
			"up":"ui/component/button/skin_liebiao_anniu/up.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function iconDisplay_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconDisplay = temp;
			temp.name = "iconDisplay";
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.text = "任命";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}