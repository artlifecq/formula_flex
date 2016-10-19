package org.mokylin.skin.common.version_3.T_tubiao.T_tishitubiao.button
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonShui_jing extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonShui_jing()
		{
			super();
			
			this.currentState = "down";
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"textAlign",
							value:"center"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xFFFFFF
						}
						,
						{target:"labelDisplay",
							name:"verticalAlign",
							value:"middle"
						}
					]
			};
			skinNames={"hong_48":"ui/common/version_3/T_tubiao/T_tishitubiao/button/shui_jing/hong_48.png",
			"hong_56":"ui/common/version_3/T_tubiao/T_tishitubiao/button/shui_jing/hong_56.png",
			"hui_48":"ui/common/version_3/T_tubiao/T_tishitubiao/button/shui_jing/hui_48.png",
			"hui_56":"ui/common/version_3/T_tubiao/T_tishitubiao/button/shui_jing/hui_56.png",
			"lan_48":"ui/common/version_3/T_tubiao/T_tishitubiao/button/shui_jing/lan_48.png",
			"lan_56":"ui/common/version_3/T_tubiao/T_tishitubiao/button/shui_jing/lan_56.png"};
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
			temp.text = "";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}