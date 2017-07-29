package org.mokylin.skin.app.beibao.button
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ItemBtnSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ItemBtnSkin()
		{
			super();
			
			this.currentState = "down";
			this.height = 59;
			this.width = 162;
			this.elementsContent = [];
			
			states = {
				down:[
						{target:"labelDisplay",
							name:"right",
							value:0
						}
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"right",
							value:0
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"bottom",
							value:0
						}
						,
						{target:"labelDisplay",
							name:"width",
							value:162
						}
					]
				,
				disabled:[
						{target:"labelDisplay",
							name:"right",
							value:0
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
							value:0xFFFFFF
						}
						,
						{target:"labelDisplay",
							name:"verticalAlign",
							value:"middle"
						}
					]
			};
			skinNames={"down":"ui/common/hover/xuanzhong.png", "hover":"ui/common/hover/xuanzhong.png", "up":"ui/common/hover/xuanqukuang2_alpha.png"};
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
			temp.text = "";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}