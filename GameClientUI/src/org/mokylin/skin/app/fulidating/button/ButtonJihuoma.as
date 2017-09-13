package org.mokylin.skin.app.fulidating.button
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonJihuoma extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonJihuoma()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.elementsContent = [];
			iconDisplay_i();
			labelDisplay_i();
			
			
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
			skinNames={"down":"ui/app/fulidating/button/btnbg/down.png,ui/app/fulidating/word/jhmdh.png",
			"downAndSelected":"ui/app/fulidating/button/btnbg/over.png,ui/app/fulidating/word/jhmdh.png",
			"hover":"ui/app/fulidating/button/btnbg/over.png,ui/app/fulidating/word/jhmdh.png",
			"hoverAndSelected":"ui/app/fulidating/button/btnbg/over.png,ui/app/fulidating/word/jhmdh.png",
			"up":"ui/app/fulidating/button/btnbg/up.png,ui/app/fulidating/word/jhmdh.png",
			"upAndSelected":"ui/app/fulidating/button/btnbg/over.png,ui/app/fulidating/word/jhmdh.png"};
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