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
	public class npcTips2_Skin extends feathers.controls.StateSkin
	{
		public var bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function npcTips2_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 56;
			this.width = 199;
			this.elementsContent = [bg_i(),__npcTips2_Skin_Label1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __npcTips2_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "npc：你到时说话啊！你到时说话啊！";
			temp.textAlign = "left";
			temp.color = 0x331103;
			temp.width = 187;
			temp.x = 6;
			temp.y = 6;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/app/npc/qpb.png";
			temp.y = 0;
			return temp;
		}

	}
}