package org.mokylin.skin.mainui.chat
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class pingdaoItems extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __pingdaoItems_UIAsset1:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function pingdaoItems()
		{
			super();
			
			this.currentState = "down";
			this.height = 20;
			this.width = 40;
			this.elementsContent = [labelDisplay_i()];
			__pingdaoItems_UIAsset1_i();
			
			
			states = {
				down:[
						{target:"labelDisplay",
							name:"color",
							value:0x868276
						}
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0xcfc6ae
						}
					]
				,
				up:[
						{target:"__pingdaoItems_UIAsset1",
							name:"alpha",
							value:0
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0x8b8d7b
						}
					]
				,
				select:[
						{target:"labelDisplay",
							name:"color",
							value:0xcfc6ae
						}
					]
			};
			skinNames={"down":"ui/common/tips/tips_di.png", "hover":"ui/common/tips/tips_di.png", "select":"ui/common/tips/tips_di.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __pingdaoItems_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__pingdaoItems_UIAsset1 = temp;
			temp.height = 20;
			temp.styleName = "ui/common/tips/tips_di.png";
			temp.width = 41;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 24;
			temp.text = "文本";
			temp.textAlign = "center";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.verticalAlign = "middle";
			temp.verticalCenter = -2;
			temp.width = 40;
			return temp;
		}

	}
}