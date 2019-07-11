### Essentials only

[1] connect

          <$>   ssh -L 16007:127.0.0.1:6006 sharib@rescomp1.well.ox.ac.uk``
          <$>   source activate kerasTFCPU
          <$>   tensorboard --logdir logs
          <$>   Instead of: http://rescomp1:6007 use http://127.0.0.1:16007 (paste on your browser)
            
[2] specific port

        <$> tensorboard --logdir logs --port 8080

[2] Close the port

        <$> fuser 6006/tcp -k
