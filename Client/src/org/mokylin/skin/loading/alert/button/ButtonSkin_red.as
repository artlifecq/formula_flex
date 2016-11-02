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
	public class ButtonSkin_red extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_red()
		{
			super();
			
			this.currentState = "down";
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"fontSize",
							value:16
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
			skinNames={"disabled":"ui/loading/alert/button/skin_red/disabled.png",
			"down":"ui/loading/alert/button/skin_red/down.png",
			"hover":"ui/loading/alert/button/skin_red/over.png",
			"up":"ui/loading/alert/button/skin_red/up.png"};
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
			temp.height = 42;
			temp.left = 0;
			temp.fontSize = 16;
			temp.text = "已 阅 读 并 同 意 声 明";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.top = 0;
			temp.verticalAlign = "middle";
			temp.width = 211;
			return temp;
		}

	}
}