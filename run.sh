#!/bin/bash
#stage1 提取语音特征(训练和测试)
cd "/home/jingxb20/paper_AVFBOIAFPV_jxb/audio/"
bash run_embedding.sh

#stage2 提取人脸特征(1、从视频中截取人脸帧，2、提取人脸特征)（训练和测试）
cd "/home/jingxb20/paper_AVFBOIAFPV_jxb/visual/facenet/"
python extract_images.py
python create_face_embeddings.py

#stage3 训练融合模型（分为四种，在这里之训练一种，其余的类似）
cd "/home/jingxb20/paper_AVFBOIAFPV_jxb/audio-visual/"
#训练融合模型
python trainning_AVN.py
#测试融合模型
python evaluation_model.py