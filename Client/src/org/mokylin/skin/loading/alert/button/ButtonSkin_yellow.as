package org.mokylin.skin.loading.alert.button
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_yellow extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_yellow()
		{
			super();
			
			this.currentState = "down";
			this.width = 90;
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"fontSize",
							value:14
						}
						,
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
			skinNames={"disabled":"ui/loading/alert/button/skin_yellow/disabled.png",
			"down":"ui/loading/alert/button/skin_yellow/down.png",
			"hover":"ui/loading/alert/button/skin_yellow/over.png",
			"up":"ui/loading/alert/button/skin_yellow/up.png"};
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
			temp.fontSize = 14;
			temp.text = "退出游戏";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}