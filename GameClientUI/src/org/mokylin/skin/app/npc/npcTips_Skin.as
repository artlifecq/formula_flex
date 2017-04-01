package org.mokylin.skin.app.npc
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class npcTips_Skin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function npcTips_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 56;
			this.width = 199;
			this.elementsContent = [__npcTips_Skin_UIAsset1_i(),__npcTips_Skin_Label1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __npcTips_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "走一走来，看一看来";
			temp.textAlign = "center";
			temp.color = 0xd6d2bd;
			temp.width = 187;
			temp.x = 6;
			temp.y = 12;
			return temp;
		}

		private function __npcTips_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/app/npc/qp.png";
			temp.y = 0;
			return temp;
		}

	}
}